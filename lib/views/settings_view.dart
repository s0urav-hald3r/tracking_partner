import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/components/settings_view/general_section.dart';
import 'package:tracking_partner/components/settings_view/support_section.dart';
import 'package:tracking_partner/components/settings_view/top_section.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopSection(),
          SizedBox(height: (65 + 20).h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              'GENERAL',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF111827),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          const GeneralSection(),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              'SUPPORT',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF111827),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          const SupportSection(),
        ],
      ),
    );
  }
}
