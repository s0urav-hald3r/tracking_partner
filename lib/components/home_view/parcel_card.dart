import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/views/track_parcel_view.dart';

class ParcelCard extends StatelessWidget {
  const ParcelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        leading: Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFFF8F8F8),
          ),
          child: Center(
            child: SvgPicture.asset(barcode),
          ),
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        collapsedShape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const TrackParcelView()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Parcel name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'J002576877423000',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: secondaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          Divider(
            height: 1.h,
            color: const Color(0xFFEEEEEE),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Courier',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'DHL Services',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: secondaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '2 3 Days',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: secondaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Processing',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: secondaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
