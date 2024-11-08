import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/config/navigation.dart';
import 'package:tracking_partner/controllers/dashboard_controller.dart';
import 'package:tracking_partner/controllers/home_controller.dart';
import 'package:tracking_partner/controllers/onboarding_controller.dart';
import 'package:tracking_partner/controllers/settings_controller.dart';
import 'package:tracking_partner/utlis/local_storage.dart';
import 'package:tracking_partner/views/dashboard_view.dart';
import 'package:tracking_partner/views/onboarding_view.dart';

Future<void> main() async {
  // Dependency injection
  Get.lazyPut(() => OnboardingController());
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => SettingsController());

  // Initialize storage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Plus Jakarta Sans',
            scaffoldBackgroundColor: const Color(0xFFFBFBFB),
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: textColor,
                backgroundColor: primaryColor,
                side: const BorderSide(color: primaryColor),
                minimumSize: Size.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          navigatorKey: Navigation.navigatorKey,
          home: LocalStorage.getData(isOnboardingDone, KeyType.BOOL)
              ? const DashboardView()
              : const OnboardingView(),
        );
      },
    );
  }
}
