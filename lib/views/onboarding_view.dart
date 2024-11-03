import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/onboarding_controller.dart';
import 'package:tracking_partner/views/dashboard_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final onboardingController = OnboardingController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7],
            colors: [primaryColor.withOpacity(.25), Colors.white],
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                _buildPageView(),
                _buildTrackButton(),
              ],
            ),
            Obx(() => _buildPageIndicators()),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          onboardingController.index = page;
        },
        children: [
          _buildBody(
              onboardingOneImage, onboardingOneTitle, onboardingTwoSubTitle),
          _buildBody(
              onboardingTwoImage, onboardingTwoTitle, onboardingTwoSubTitle),
          _buildBody(onboardingThreeImage, onboardingThreeTitle,
              onboardingThreeSubTitle),
          _buildBody(
              onboardingFourImage, onboardingFourTitle, onboardingFourSubTitle),
        ],
      ),
    );
  }

  Widget _buildBody(String image, String title, String subTitle) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 529.h,
          child: _buildImageAsset(image),
        ),
        Expanded(
          child: _buildContentBody(title, subTitle),
        )
      ],
    );
  }

  Widget _buildImageAsset(String assetPath) {
    return Image.asset(
      assetPath,
      errorBuilder: (context, error, stackTrace) => const Center(
        child: Icon(Icons.error, color: Colors.red),
      ),
    );
  }

  Widget _buildContentBody(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: secondaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackButton() {
    return Container(
      height: 45.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: ElevatedButton(
        onPressed: () {
          // Define action here
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => const DashboardView()),
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 45.h),
        ),
        child: Text(
          'Track your first parcel',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Container(
      width: double.infinity,
      height: 529.h,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) => _buildIndicator(index)),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return InkWell(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        width: 8.w,
        height: 8.w,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              onboardingController.index == index ? primaryColor : Colors.white,
          border: Border.all(
            color:
                onboardingController.index == index ? primaryColor : textColor,
          ),
        ),
      ),
    );
  }
}
