import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/home_controller.dart';

class CarrierSection extends StatelessWidget {
  const CarrierSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          child: Obx(
            () => CustomDropdown<String>(
              initialItem: controller.carrierName.isEmpty
                  ? null
                  : controller.carrierName,
              hintText: controller.isSearching
                  ? 'Searching... ⌛️'
                  : 'Select carrier partner',
              closedHeaderPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: CustomDropdownDecoration(
                closedSuffixIcon: const Icon(Icons.keyboard_arrow_down),
                expandedSuffixIcon: const Icon(Icons.keyboard_arrow_up),
                closedFillColor: Colors.white,
                closedBorder: Border.all(color: primaryColor),
                closedBorderRadius: BorderRadius.circular(10.r),
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor.withOpacity(.5),
                ),
                headerStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
                listItemStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              items:
                  controller.carrierData.map((e) => e[0].toString()).toList(),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
