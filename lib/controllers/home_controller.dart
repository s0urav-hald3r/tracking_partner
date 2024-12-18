import 'dart:convert';
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/config/navigation.dart';
import 'package:tracking_partner/controllers/settings_controller.dart';
import 'package:tracking_partner/models/parcel_card_model.dart';
import 'package:tracking_partner/models/parcel_details_model.dart';
import 'package:tracking_partner/services/dio_client.dart';
import 'package:tracking_partner/utlis/local_storage.dart';
import 'package:tracking_partner/utlis/popup.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final DioClient _dioClient = DioClient();

  final tNumberController = TextEditingController();
  final pNameController = TextEditingController();

  final controller = SettingsController.instance;

  @override
  void onInit() {
    super.onInit();
    parcelIcon = parcelIcons[iconIndex];
    retriveParcels();
    loadCsvData();
  }

  Future<void> retriveParcels() async {
    isLoading = true;
    String jsonString = LocalStorage.getData(parcelList, KeyType.STR);

    if (jsonString.isNotEmpty) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      parcelCardList =
          jsonList.map((json) => ParcelCardModel.fromJson(json)).toList();
    } else {
      parcelCardList = <ParcelCardModel>[];
    }
    debugPrint('parcelCardList: ${parcelCardList.length}');

    controller.ifPremium = LocalStorage.getData(isPremium, KeyType.BOOL);
    debugPrint('controller.ifPremium: ${controller.ifPremium}');

    isLoading = false;
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
  final List parcelIcons = [
    '👞',
    '📱',
    '📦',
    '💻',
    '👕',
    '💄',
    '⚽️',
    '🕶️',
    '🖥️',
    '💊',
    '📚',
    '🏏',
    '🎒',
    '🧸',
  ];

  // Private variables
  final RxInt _iconIndex = 0.obs;
  final RxString _parcelIcon = ''.obs;
  final RxBool _isSearching = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isDetailsLoading = false.obs;
  final RxString _carrierName = ''.obs;
  final RxList<List<dynamic>> _carrierData = <List<dynamic>>[].obs;
  final RxList<ParcelCardModel> _parcelCardList = <ParcelCardModel>[].obs;

  // Getters
  int get iconIndex => _iconIndex.value;
  String get parcelIcon => _parcelIcon.value;
  bool get isSearching => _isSearching.value;
  bool get isLoading => _isLoading.value;
  bool get isDetailsLoading => _isDetailsLoading.value;
  String get carrierName => _carrierName.value;
  List get carrierData => _carrierData;
  List<ParcelCardModel> get parcelCardList => _parcelCardList;

  // Setters
  set iconIndex(value) => _iconIndex.value = value;
  set parcelIcon(icon) => _parcelIcon.value = icon;
  set isSearching(status) => _isSearching.value = status;
  set isLoading(status) => _isLoading.value = status;
  set isDetailsLoading(status) => _isDetailsLoading.value = status;
  set carrierName(icon) => _carrierName.value = icon;
  set carrierData(newData) => _carrierData.value = newData;
  set parcelCardList(newData) => _parcelCardList.value = newData;

  void fillTextField({String? trackingId}) {
    if (trackingId != null) {
      tNumberController.text = trackingId;
    }
  }

  // Function for API calls
  Future<void> detectPartner({String? trackingId}) async {
    try {
      isSearching = true;

      if (trackingId != null) {
        tNumberController.text = trackingId;
      }

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

  Future<void> addParcel() async {
    if (tNumberController.text.isEmpty) {
      TPopup.warningSnackbar(message: 'Tracking number can\'t be empty.');
      return;
    }

    if (carrierName.isEmpty) {
      TPopup.warningSnackbar(message: 'Select a carrier partner.');
      return;
    }

    if (pNameController.text.isEmpty) {
      TPopup.warningSnackbar(message: 'Required parcel name to procced.');
      return;
    }

    int index = parcelCardList.indexWhere(
        (parcel) => parcel.trackingNumber == tNumberController.text);

    if (index != -1) {
      TPopup.warningSnackbar(message: 'Tracking Id already exists.');
      return;
    }

    final parcelCardModel = ParcelCardModel(
      packageIcon: parcelIcon,
      trackingNumber: tNumberController.text,
      carrier: carrierName,
      parcelName: pNameController.text,
    );

    _parcelCardList.add(parcelCardModel);

    saveToLocal();

    Navigation.pop();
  }

  void saveToLocal() {
    String jsonString =
        jsonEncode(parcelCardList.map((model) => model.toJson()).toList());

    LocalStorage.addData(parcelList, jsonString);
  }

  Future<ParcelDetailsModel?> getParcelDetails(trackingId) async {
    try {
      ParcelDetailsModel parcel;

      isDetailsLoading = true;

      Response response = await _dioClient
          .post('https://parcelsapp.com/api/v3/shipments/tracking', body: {
        "shipments": [
          {"trackingId": trackingId, "destinationCountry": "MOCK_COUNTRY"}
        ],
        "language": "en",
        "apiKey": pAPIKey
      });

      parcel = ParcelDetailsModel.fromJson(response.data);

      if (parcel.uuid != null) {
        Response response = await _dioClient.get(
            'https://parcelsapp.com/api/v3/shipments/tracking?uuid=${parcel.uuid}&apiKey=$pAPIKey');

        parcel = ParcelDetailsModel.fromJson(response.data);

        parcel = await recursiveApiCall(parcel, 1);

        isDetailsLoading = false;
        return parcel;
      }

      isDetailsLoading = false;
      return parcel;
    } catch (e) {
      isDetailsLoading = false;
      return null;
    }
  }

  Future<ParcelDetailsModel> recursiveApiCall(
      ParcelDetailsModel p, int times) async {
    debugPrint('recursiveApiCall count: $times');
    if (times >= 5) return p;

    times++;

    if (p.shipments.isNotEmpty && p.shipments.first.states.isNotEmpty) {
      return p;
    }

    Response response = await _dioClient.get(
        'https://parcelsapp.com/api/v3/shipments/tracking?uuid=${p.uuid}&apiKey=$pAPIKey');

    p = ParcelDetailsModel.fromJson(response.data);

    return recursiveApiCall(p, times);
  }

  clearState() {
    tNumberController.clear();
    pNameController.clear();
    iconIndex = 0;
    carrierName = '';
  }
}
