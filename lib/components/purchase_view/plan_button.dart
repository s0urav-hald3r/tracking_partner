import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/settings_controller.dart';

String locale = window.locale.toString(); // e.g., 'en_US', 'en_IN'

/// Converts an annual price to a weekly price and formats it with a currency symbol.
String convertAnnualToWeekly({
  required double annualPrice,
  required String currencyCode,
  required String locale,
}) {
  // Convert annual price to weekly price (52 weeks in a year)
  double weeklyPrice = annualPrice / 52;

  // Format the price with the currency symbol
  final format =
      NumberFormat.simpleCurrency(locale: locale, name: currencyCode);
  return format.format(weeklyPrice);
}

class PlanButton extends StatelessWidget {
  const PlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.instance;

    return Obx(
      () {
        StoreProduct aPlan = controller.storeProduct
            .firstWhere((element) => element.identifier == annualPlan);

        StoreProduct wPlan = controller.storeProduct
            .firstWhere((element) => element.identifier == weeklyPlan);

        // String price = convertAnnualToWeekly(
        //   annualPrice: aPlan.price,
        //   currencyCode: aPlan.currencyCode,
        //   locale: locale,
        // );

        return Column(
          children: [
            InkWell(
              onTap: () => controller.plan = Plan.PAID,
              child: Container(
                width: double.infinity,
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: controller.plan == Plan.PAID
                      ? const Color(0xFFFFFBEB)
                      : Colors.white,
                  border: Border.all(
                    color: controller.plan == Plan.PAID
                        ? primaryColor
                        : const Color(0xFFEEEEEE),
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Annual Plan',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                    Text(
                      aPlan.priceString,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () => controller.plan = Plan.FREE,
              child: Container(
                width: double.infinity,
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: controller.plan == Plan.FREE
                      ? const Color(0xFFFFFBEB)
                      : Colors.white,
                  border: Border.all(
                    color: controller.plan == Plan.FREE
                        ? primaryColor
                        : const Color(0xFFEEEEEE),
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weekly Plan',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                    Text(
                      wPlan.priceString,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
