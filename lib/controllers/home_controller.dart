import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/services/dio_client.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final DioClient _dioClient = DioClient();

  final tNumberController = TextEditingController();
  final pNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadCsvData();
  }

  Future<void> loadCsvData() async {
    try {
      // Load CSV data from assets
      final csvString =
          await rootBundle.loadString('assets/static/couriers.csv');

      // Parse CSV data
      List<List<dynamic>> rows =
          const CsvToListConverter().convert(csvString, fieldDelimiter: '\n');

      // Extract carrier names (skip header)
      carrierData = rows.skip(1).toList().map((e) {
        //
        return RegExp(r'[^,\[\]]+')
            .allMatches(e.toString())
            .map((match) => match.group(0)!.trim())
            .toList();
      }).toList();
    } catch (e) {
      log("Error loading CSV data: $e");
    }
  }

  // List of icons to display in the list
  final List parcelIcons = ['👞', '📱', '📦', '💻', '👕', '💄', '⚽️', '🕶️'];

  // Private variables
  final RxInt _iconIndex = 0.obs;
  final RxString _parcelIcon = ''.obs;
  final RxBool _isSearching = false.obs;
  final RxString _carrierName = ''.obs;
  final RxList<List<dynamic>> _carrierData = <List<dynamic>>[].obs;

  // Getters
  int get iconIndex => _iconIndex.value;
  String get parcelIcon => _parcelIcon.value;
  bool get isSearching => _isSearching.value;
  String get carrierName => _carrierName.value;
  List get carrierData => _carrierData;

  // Setters
  set iconIndex(value) => _iconIndex.value = value;
  set parcelIcon(icon) => _parcelIcon.value = icon;
  set isSearching(status) => _isSearching.value = status;
  set carrierName(icon) => _carrierName.value = icon;
  set carrierData(newData) => _carrierData.value = newData;

  // Function for API calls
  Future<void> detectPartner() async {
    try {
      isSearching = true;

      Response response = await _dioClient.post(
          'https://api.trackingmore.com/v4/couriers/detect',
          body: {"tracking_number": tNumberController.text},
          headers: {"Tracking-Api-Key": tAPIKey});

      carrierName = response.data['data'][0]['courier_name'];

      isSearching = false;
    } catch (e) {
      isSearching = false;
      log(e.toString());
    }
  }
}
