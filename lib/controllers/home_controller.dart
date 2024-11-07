import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/services/dio_client.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final DioClient _dioClient = DioClient();

  final tNumberController = TextEditingController();
  final pNameController = TextEditingController();

  // List of icons to display in the list
  final List parcelIcons = ['👞', '📱', '📦', '💻', '👕', '💄', '⚽️', '🕶️'];

  // Private variables
  final RxInt _iconIndex = 0.obs;
  final RxString _parcelIcon = ''.obs;
  final RxBool _isSearching = false.obs;
  final RxString _carrierName = ''.obs;

  // Getters
  int get iconIndex => _iconIndex.value;
  String get parcelIcon => _parcelIcon.value;
  bool get isSearching => _isSearching.value;
  String get carrierName => _carrierName.value;

  // Setters
  set iconIndex(value) => _iconIndex.value = value;
  set parcelIcon(icon) => _parcelIcon.value = icon;
  set isSearching(status) => _isSearching.value = status;
  set carrierName(icon) => _carrierName.value = icon;

  // Function for API calls
  Future<void> detectPartner() async {
    try {
      isSearching = true;

      Response response = await _dioClient.post(
          'https://api.trackingmore.com/v4/couriers/detect',
          body: {"tracking_number": tNumberController.text},
          headers: {"Tracking-Api-Key": tAPIKey});

      final jsonbody = jsonDecode(response.data);

      isSearching = false;
    } catch (e) {}
  }
}
