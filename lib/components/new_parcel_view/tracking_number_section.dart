import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/home_controller.dart';
import 'package:tracking_partner/views/scan_view.dart';

class TrackingNumberSection extends StatelessWidget {
  const TrackingNumberSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
          child: Text(
            'Tracking Number',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12.sp,
              color: secondaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          height: 45.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: CupertinoTextField(
            controller: HomeController.instance.tNumberController,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              HomeController.instance.detectPartner();
            },
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFEEEEEE)),
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.only(left: 10.w),
            suffix: InkWell(
              onTap: () async {
                String trackingId = await Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const ScanView()),
                );
                HomeController.instance.detectPartner(trackingId: trackingId);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                child: SvgPicture.asset(barcode),
              ),
            ),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: secondaryColor,
            ),
            placeholder: 'Enter Tracking  Number...',
            placeholderStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: secondaryColor.withOpacity(.5),
            ),
          ),
        ),
      ],
    );
  }
}
