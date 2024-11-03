import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_partner/config/constants.dart';

class KeyFeatures extends StatelessWidget {
  const KeyFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            SvgPicture.asset(unlimitedParcel),
            SizedBox(height: 5.h),
            Text(
              'Unlimited\nParcels',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: greyColor,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(courier),
            SizedBox(height: 5.h),
            Text(
              '1000+\nCouriers',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: greyColor,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(courierDitection),
            SizedBox(height: 5.h),
            Text(
              'Carrier auto\ndetection',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: greyColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
