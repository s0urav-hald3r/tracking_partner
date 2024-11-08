import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/config/navigation.dart';
import 'package:tracking_partner/models/parcel_card_model.dart';
import 'package:tracking_partner/views/track_parcel_view.dart';

class ParcelCard extends StatelessWidget {
  final ParcelCardModel parcel;
  const ParcelCard({super.key, required this.parcel});

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
            child: Text(
              parcel.packageIcon!,
              style: TextStyle(fontSize: 20.sp),
            ),
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
            Navigation.push(const TrackParcelView());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                parcel.parcelName ?? 'Parcel name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                parcel.trackingNumber ?? 'J002576877423000',
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
                    parcel.carrier ?? 'NA',
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
                    parcel.estimatedTime ?? 'NA',
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
                    parcel.status ?? 'NA',
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
