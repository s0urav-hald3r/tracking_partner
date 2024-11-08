import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/models/parcel_details_model.dart' as pdm;

class StepTile extends StatelessWidget {
  final pdm.State step;
  final bool isLast;

  const StepTile({super.key, required this.step, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat("dd MM yyyy hh:mm:ss a")
        .format(step.date ?? DateTime.now().toLocal());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              Icons.check_circle,
              color: isLast ? const Color(0xFF29BE10) : secondaryColor,
              size: 24.sp,
            ),
            Container(
              height: 60.h,
              margin: EdgeInsets.symmetric(vertical: 2.5.h),
              child: DottedLine(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 2.0,
                dashColor: isLast ? const Color(0xFF29BE10) : secondaryColor,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            )
          ],
        ),
        SizedBox(width: 10.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(
                  step.status ?? 'Unknown status',
                  style: TextStyle(
                    color: isLast ? const Color(0xFF29BE10) : greyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                '$date ${step.location ?? ''}',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
