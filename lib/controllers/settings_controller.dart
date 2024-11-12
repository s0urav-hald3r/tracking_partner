import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:tracking_partner/config/constants.dart';

enum Plan { FREE, PAID }

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    fetchProducts();
  }

  // Private variables
  final RxBool _isNotificationEnable = true.obs;
  final _plan = Plan.FREE.obs;

  final RxList<StoreProduct> _storeProduct = <StoreProduct>[].obs;

  // Getters
  bool get isNotificationEnable => _isNotificationEnable.value;
  Plan get plan => _plan.value;

  List get storeProduct => _storeProduct;

  // Setters
  set isNotificationEnable(value) => _isNotificationEnable.value = value;
  set plan(value) => _plan.value = value;

  set storeProduct(value) => _storeProduct.value = value;

  // Functions
  Future fetchProducts() async {
    try {
      final products = await Purchases.getProducts(planIds);
      log('products: $products');
      _storeProduct.clear();
      storeProduct = products;
    } catch (e) {
      log(e.toString());
    }
  }

  Future purchaseProduct(StoreProduct storeProduct) async {
    try {
      CustomerInfo customerInfo =
          await Purchases.purchaseStoreProduct(storeProduct);
      log('customerInfo while purchase: $customerInfo');
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        log('PurchasesErrorCode.purchaseCancelledError');
        return;
      }
    }
  }

  Future restorePurchases() async {
    try {
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      log('customerInfo while restore: $customerInfo');
      List activeSubscriptions = customerInfo.activeSubscriptions;
      log('activeSubscriptions: $activeSubscriptions');
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode == PurchasesErrorCode.receiptAlreadyInUseError) {
        log('PurchasesErrorCode.receiptAlreadyInUseError');
        return;
      }
      if (errorCode == PurchasesErrorCode.missingReceiptFileError) {
        log('PurchasesErrorCode.missingReceiptFileError');
        return;
      }
    }
  }
}
