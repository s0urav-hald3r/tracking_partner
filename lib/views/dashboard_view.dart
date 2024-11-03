import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final dashboardController = DashboardController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Image.asset(dashboardFAB),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: const [Iconsax.home_2, Iconsax.setting_2],
          activeIndex: dashboardController.currentIndex,
          iconSize: 24.sp,
          gapLocation: GapLocation.center,
          activeColor: primaryColor,
          inactiveColor: const Color(0xFFB6B8C1),
          backgroundColor: Colors.white,
          notchSmoothness: NotchSmoothness.smoothEdge,
          onTap: (index) {
            dashboardController.currentIndex = index;
          },
        ),
      ),
    );
  }
}
