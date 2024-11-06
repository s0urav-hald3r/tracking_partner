import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/models/step_model.dart';

class StepTile extends StatelessWidget {
  final StepModel step;

  const StepTile({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              step.isCompleted
                  ? Icons.check_circle
                  : Icons.radio_button_checked,
              color:
                  step.isHighlighted ? const Color(0xFF29BE10) : secondaryColor,
              size: 24.sp,
            ),
            Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(vertical: 2.5.h),
              child: DottedLine(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 2.0,
                dashColor:
                    step.isCompleted ? const Color(0xFF29BE10) : secondaryColor,
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
                  step.title,
                  style: TextStyle(
                    color: step.isHighlighted
                        ? const Color(0xFF29BE10)
                        : greyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                step.subtitle,
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
