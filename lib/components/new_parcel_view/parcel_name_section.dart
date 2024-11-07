import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/home_controller.dart';

class ParcelNameSection extends StatelessWidget {
  const ParcelNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
          child: Text(
            'Parcel Name',
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
            controller: HomeController.instance.pNameController,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFEEEEEE)),
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.only(left: 10.w),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: secondaryColor,
            ),
            placeholder: 'Enter a name for the parcel',
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
