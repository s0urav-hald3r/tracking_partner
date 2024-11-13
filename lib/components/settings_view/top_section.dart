import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/settings_controller.dart';
import 'package:tracking_partner/views/purchase_view.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.instance;

    return Obx(
      () => Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            padding: EdgeInsets.fromLTRB(
              20.w,
              MediaQuery.of(context).padding.top,
              20.w,
              20.h,
            ),
            margin: EdgeInsets.only(bottom: 65.h),
            child: Text(
              'Settings',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.sp,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 115.h,
            child: Container(
              width: 335.w,
              height: 130.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.ifPremium
                            ? 'Congratulations 🎊'
                            : 'Unlock Full  Access',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: textColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 160.w,
                        child: Text(
                          'Unlimited Parcels, 1000+ Couriers push notification',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30.h,
                        child: ElevatedButton(
                          onPressed: () {
                            // Define action here
                            controller.ifPremium
                                ? null
                                : Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const PurchaseView()),
                                  );
                          },
                          child: Text(
                            controller.ifPremium ? 'Subscribed' : 'Unlock All',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SvgPicture.asset(unlockPremium)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
