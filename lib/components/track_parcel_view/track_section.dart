import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/components/track_parcel_view/step_tile.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/models/parcel_details_model.dart' as pdm;

class TrackSection extends StatelessWidget {
  final pdm.ParcelDetailsModel parcel;
  const TrackSection({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tracking Details',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 20.h),
            parcel.shipments.isNotEmpty &&
                    parcel.shipments.first.states.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: parcel.shipments.first.states.length,
                      itemBuilder: (context, index) {
                        return StepTile(
                          step: parcel.shipments.first.states[index],
                          isLast: index == 0,
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timeline_outlined,
                            size: 24.sp,
                            color: secondaryColor,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'No records found',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
