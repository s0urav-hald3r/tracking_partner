import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/settings_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchaseLinks extends StatelessWidget {
  const PurchaseLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      InkWell(
        onTap: () async {
          Uri uri = Uri.parse(termsCondition);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch $uri');
          }
        },
        child: Text(
          'Terms of Use',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: greyColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      InkWell(
        onTap: () => SettingsController.instance.restorePurchases(),
        child: Text(
          'Restore Purchase',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: greyColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          Uri uri = Uri.parse(privacyPolicy);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch $uri');
          }
        },
        child: Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: greyColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ]);
  }
}
