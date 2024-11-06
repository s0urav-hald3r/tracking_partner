import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/components/track_parcel_view/step_tile.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/models/step_model.dart';

class TrackSection extends StatefulWidget {
  const TrackSection({super.key});

  @override
  State<TrackSection> createState() => _TrackSectionState();
}

class _TrackSectionState extends State<TrackSection> {
  final List<StepModel> steps = [
    StepModel(
      title: 'Successfully Delivered',
      subtitle:
          'November 01, 2024 08:12:39 AM at Rock hill, SC, United States 200300',
      isCompleted: true,
      isHighlighted: true,
    ),
    StepModel(
      title: 'In-Transit',
      subtitle:
          'November 01, 2024 08:12:39 AM at Rock hill, SC, United States 200300',
      isCompleted: true,
    ),
    StepModel(
      title: 'Pickup Confirmation',
      subtitle:
          'November 01, 2024 08:12:39 AM at Rock hill, SC, United States 200300',
      isCompleted: true,
    ),
    StepModel(
      title: 'Parcel Preparation',
      subtitle:
          'November 01, 2024 08:12:39 AM at Rock hill, SC, United States 200300',
      isCompleted: true,
    ),
    StepModel(
      title: 'Parcel Received',
      subtitle:
          'November 01, 2024 08:12:39 AM at Rock hill, SC, United States 200300',
      isCompleted: true,
    ),
  ];

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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return StepTile(step: steps[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
