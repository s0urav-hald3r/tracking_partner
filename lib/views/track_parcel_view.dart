import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tracking_partner/components/track_parcel_view/top_card.dart';
import 'package:tracking_partner/components/track_parcel_view/track_section.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/controllers/home_controller.dart';
import 'package:tracking_partner/models/parcel_card_model.dart';
import 'package:tracking_partner/models/parcel_details_model.dart' as pdm;

class TrackParcelView extends StatefulWidget {
  final String trackingId;
  const TrackParcelView({super.key, required this.trackingId});

  @override
  State<TrackParcelView> createState() => _TrackParcelViewState();
}

class _TrackParcelViewState extends State<TrackParcelView> {
  late pdm.ParcelDetailsModel? parcelDetails;
  late ParcelCardModel parcelCard;
  late int index;
  final controller = HomeController.instance;

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  Future<void> callAPI() async {
    parcelDetails = await controller.getParcelDetails(widget.trackingId);

    parcelCard = controller.parcelCardList
        .firstWhere((parcel) => parcel.trackingNumber == widget.trackingId);

    index = controller.parcelCardList
        .indexWhere((parcel) => parcel.trackingNumber == widget.trackingId);

    if (parcelDetails!.shipments.isNotEmpty) {
      controller.parcelCardList[index] =
          parcelCard.copyWith(status: parcelDetails?.shipments.first.status);
      controller.saveToLocal();
    }
  }

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
      body: Obx(
        () {
          if (controller.isDetailsLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopCard(parcel: controller.parcelCardList[index]),

              TrackSection(parcel: parcelDetails!),
              SizedBox(height: 85.h),
              // Container(
              //   height: 45.h,
              //   width: double.infinity,
              //   margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // Define action here
              //     },
              //     child: Text(
              //       'View Parcel Items',
              //       style: TextStyle(
              //         fontSize: 14.sp,
              //         fontWeight: FontWeight.w700,
              //       ),
              //     ),
              //   ),
              // )
            ],
          );
        },
      ),
    );
  }
}
