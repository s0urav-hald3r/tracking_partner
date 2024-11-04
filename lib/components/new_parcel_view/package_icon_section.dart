import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/dashboard_controller.dart';

class PackageIconSection extends StatefulWidget {
  const PackageIconSection({super.key});

  @override
  State<PackageIconSection> createState() => _PackageIconSectionState();
}

class _PackageIconSectionState extends State<PackageIconSection> {
  final controller = DashboardController.instance;

  // List of icons to display in the list
  final List _icons = ['👞', '📱', '📦', '💻', '👕', '💄', '⚽️', '🕶️'];

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: 60.h,
          child: InfiniteCarousel.builder(
            itemCount: _icons.length,
            itemExtent: 70.w,
            center: true,
            anchor: 0.0,
            velocityFactor: 0.2,
            onIndexChanged: (index) {
              controller.iconIndex = index;
            },
            // controller: controller,
            axisDirection: Axis.horizontal,
            loop: true,
            itemBuilder: (context, index, realIndex) {
              return Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: index == controller.iconIndex
                        ? primaryColor.withOpacity(.25)
                        : const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: index == controller.iconIndex
                          ? primaryColor
                          : const Color(0xFFF8F8F8),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _icons[index],
                      style: TextStyle(
                        fontSize: index == controller.iconIndex ? 26.sp : 20.sp,
                        color: index == controller.iconIndex
                            ? textColor
                            : secondaryColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
