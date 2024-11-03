import 'package:flutter/material.dart';
import 'package:tracking_partner/components/home_page_top_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [HomePageTopSection()],
      ),
    );
  }
}
