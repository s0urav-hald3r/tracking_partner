import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_partner/config/constants.dart';

class GeneralSection extends StatefulWidget {
  const GeneralSection({super.key});

  @override
  State<GeneralSection> createState() => _GeneralSectionState();
}

class _GeneralSectionState extends State<GeneralSection> {
  final _controller = ValueNotifier<bool>(false);

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
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xFFF8F8F8),
                ),
                child: Center(
                  child: SvgPicture.asset(bell),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Notification',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              AdvancedSwitch(
                controller: _controller,
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                activeChild: const Text('I'),
                inactiveChild: const Text('O'),
                width: 36.w,
                height: 18.h,
                enabled: true,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xFFF8F8F8),
                ),
                child: Center(
                  child: SvgPicture.asset(share),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Share the app',
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
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xFFF8F8F8),
                ),
                child: Center(
                  child: SvgPicture.asset(feedback),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Feedback',
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
