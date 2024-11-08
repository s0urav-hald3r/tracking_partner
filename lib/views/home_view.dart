import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tracking_partner/components/home_view/top_section.dart';
import 'package:tracking_partner/components/home_view/parcel_card.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            const TopSection(),
            controller.isLoading
                ? const Expanded(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
                : controller.parcelCardList.isEmpty
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.data_object_outlined,
                              size: 30.sp,
                              color: secondaryColor,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'No active parcel found',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.parcelCardList.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          itemBuilder: (context, index) {
                            return ParcelCard(
                                parcel: controller.parcelCardList[index]);
                          },
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
