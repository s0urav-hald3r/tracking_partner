import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        cameraFacing: CameraFacing.back,
        formatsAllowed: const [
          BarcodeFormat.qrcode,
          BarcodeFormat.code128,
          BarcodeFormat.ean13
        ],
        overlay: QrScannerOverlayShape(
          cutOutSize: 285.sp,
          borderColor: const Color(0xFFFD2323),
          borderLength: 75,
          borderRadius: 20.r,
          borderWidth: 10.sp,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      String scannedCode = scanData.code.toString();
      // Log the entire scanned data
      log(scannedCode);

      // Use a regular expression to find the tracking number (example format: MS followed by digits)
      RegExp trackingNumberPattern = RegExp(r'\b(FMPP|MS)\d+\b');
      Match? match = trackingNumberPattern.firstMatch(scannedCode);

      if (match != null) {
        String trackingNumber = match.group(0) ?? '';
        log('Tracking Number: $trackingNumber');
        controller.pauseCamera();

        // Check if the widget is still mounted before navigating
        if (mounted) {
          Navigator.pop(context, trackingNumber);
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
