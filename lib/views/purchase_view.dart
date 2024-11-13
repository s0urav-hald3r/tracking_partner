import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:tracking_partner/components/purchase_view/key_features.dart';
import 'package:tracking_partner/components/purchase_view/plan_button.dart';
import 'package:tracking_partner/components/purchase_view/purchase_links.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/settings_controller.dart';

class PurchaseView extends StatefulWidget {
  const PurchaseView({super.key});

  @override
  State<PurchaseView> createState() => _PurchaseViewState();
}

class _PurchaseViewState extends State<PurchaseView> {
  late final ValueNotifier<bool> _controller;
  final settingsController = SettingsController.instance;

  @override
  void initState() {
    super.initState();
    _controller = ValueNotifier<bool>(settingsController.plan == Plan.FREE);
    _controller.addListener(() {
      settingsController.plan = _controller.value ? Plan.FREE : Plan.PAID;
    });
  }

  @override
  Widget build(BuildContext context) {
    StoreProduct weekly = settingsController.storeProduct
        .firstWhere((element) => element.identifier == weeklyPlan);
    StoreProduct annual = settingsController.storeProduct
        .firstWhere((element) => element.identifier == annualPlan);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(close),
                      )
                    ],
                  ),
                  SvgPicture.asset(premiumBaner),
                  Text(
                    'Unlock Full  Access',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const KeyFeatures(),
                  SizedBox(height: 20.h),
                  const PlanButton(),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free Trial Enabled',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                      Obx(
                        () => AdvancedSwitch(
                          controller: _controller,
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey,
                          activeChild: const Text('I'),
                          inactiveChild: const Text('O'),
                          initialValue: settingsController.plan == Plan.FREE,
                          width: 36.w,
                          height: 18.h,
                          enabled: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 45.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Define action here
                        settingsController.purchaseProduct(
                            settingsController.plan == Plan.FREE
                                ? weekly
                                : annual);
                      },
                      child: Obx(
                        () => Text(
                          settingsController.plan == Plan.FREE
                              ? 'Try For FREE'
                              : 'Continue ≻',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Obx(
                    () => Text(
                      settingsController.plan == Plan.FREE
                          ? '3 Days free, then auto renewable for ₹${weekly.price.toStringAsFixed(2)}/week'
                          : 'Auto-renewable subscription for ₹${annual.price.toStringAsFixed(2)}/year',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const PurchaseLinks()
                ],
              ),
            ),
            if (settingsController.isLoading)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black38,
                child: const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
