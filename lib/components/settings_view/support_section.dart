import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/config/constants.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Terms & Condition',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(Icons.chevron_right, size: 18.sp)
            ],
          ),
          Row(
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(Icons.chevron_right, size: 18.sp)
            ],
          ),
          Row(
            children: [
              Text(
                'Help & Support',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(Icons.chevron_right, size: 18.sp)
            ],
          ),
          Row(
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(Icons.chevron_right, size: 18.sp)
            ],
          ),
        ],
      ),
    );
  }
}
