import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/components/track_parcel_view/top_card.dart';
import 'package:tracking_partner/components/track_parcel_view/track_section.dart';
import 'package:tracking_partner/config/constants.dart';

class TrackParcelView extends StatelessWidget {
  const TrackParcelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Track Your Parcel',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TopCard(),
          const TrackSection(),
          Container(
            height: 45.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: ElevatedButton(
              onPressed: () {
                // Define action here
              },
              child: Text(
                'View Parcel Items',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
