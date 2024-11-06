import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/components/new_parcel_view/carrier_section.dart';
import 'package:tracking_partner/components/new_parcel_view/parcel_name_section.dart';
import 'package:tracking_partner/components/new_parcel_view/package_icon_section.dart';
import 'package:tracking_partner/components/new_parcel_view/tracking_number_section.dart';
import 'package:tracking_partner/config/constants.dart';

class NewParcelView extends StatelessWidget {
  const NewParcelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Add New Parcel',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PackageIconSection(),
          const TrackingNumberSection(),
          const CarrierSection(),
          const ParcelNameSection(),
          const Spacer(),
          Container(
            height: 45.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: ElevatedButton(
              onPressed: () {
                // Define action here
              },
              child: Text(
                'Add Parcel',
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
