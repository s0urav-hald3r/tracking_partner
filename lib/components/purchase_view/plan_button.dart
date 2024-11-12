import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/settings_controller.dart';

class PlanButton extends StatelessWidget {
  const PlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.instance;

    return Obx(
      () {
        StoreProduct plan = controller.storeProduct
            .firstWhere((element) => element.identifier == annualPlan);

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '₹${(plan.price / 52).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        ),
                        Text(
                          'Per Week',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: greyColor,
                          ),
                        ),
                      ],
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
                      '3 Days Trial',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                    Text(
                      'Free',
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
