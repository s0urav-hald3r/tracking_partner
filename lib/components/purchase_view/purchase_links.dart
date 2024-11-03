import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/config/constants.dart';

class PurchaseLinks extends StatelessWidget {
  const PurchaseLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Terms of Use',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: greyColor,
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          'Restore Purchase',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: greyColor,
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: greyColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
