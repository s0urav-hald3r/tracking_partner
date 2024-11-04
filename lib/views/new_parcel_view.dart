import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_partner/config/constants.dart';

class NewParcelView extends StatefulWidget {
  const NewParcelView({super.key});

  @override
  State<NewParcelView> createState() => _NewParcelViewState();
}

class _NewParcelViewState extends State<NewParcelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Add New Parcel',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
            child: Text(
              'Package Icon',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12.sp,
                color: secondaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
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
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
            child: Text(
              'Carrier',
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
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.only(left: 10.w),
              suffix: Padding(
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                child: const Icon(Icons.keyboard_arrow_down_rounded),
              ),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
            child: Text(
              'Description',
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
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: secondaryColor,
              ),
              placeholder: 'Enter a description for the parcel',
              placeholderStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: secondaryColor.withOpacity(.5),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 45.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: ElevatedButton(
              onPressed: () {
                // Define action here
              },
              child: Text(
                'Add Parcel',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
