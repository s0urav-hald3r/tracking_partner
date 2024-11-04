import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_partner/config/constants.dart';

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
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFEEEEEE)),
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.only(left: 10.w),
            suffix: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: SvgPicture.asset(barcode),
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
