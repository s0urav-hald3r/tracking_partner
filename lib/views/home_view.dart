import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_partner/components/home_view/top_section.dart';
import 'package:tracking_partner/components/home_view/parcel_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopSection(),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              itemBuilder: (context, index) {
                return const ParcelCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
