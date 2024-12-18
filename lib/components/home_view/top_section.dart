import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/home_controller.dart';
import 'package:tracking_partner/views/new_parcel_view.dart';
import 'package:tracking_partner/views/scan_view.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Container(
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
          20.w, MediaQuery.of(context).padding.top, 20.w, 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Track Your Parcels',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: textColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Add  & Track Parcels',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const NewParcelView()),
                    );
                  },
                  child: SvgPicture.asset(add))
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45.h,
                  child: CupertinoTextField(
                    controller: controller.tNumberController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      controller.detectPartner();
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const NewParcelView()),
                      );
                    },
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    prefix: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: SvgPicture.asset(gps),
                    ),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                    ),
                    placeholder: 'Enter Tracking  Number...',
                    placeholderStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: secondaryColor.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () async {
                  String trackingId = await Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const ScanView()),
                  );

                  controller.fillTextField(trackingId: trackingId);
                },
                child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: SvgPicture.asset(barcode),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
