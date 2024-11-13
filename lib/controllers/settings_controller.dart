import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:tracking_partner/config/constants.dart';
import 'package:tracking_partner/utlis/local_storage.dart';

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
  final RxBool _ifPremium = false.obs;
  final RxBool _isLoading = false.obs;
  final _plan = Plan.FREE.obs;

  final RxList<StoreProduct> _storeProduct = <StoreProduct>[].obs;

  // Getters
  bool get isNotificationEnable => _isNotificationEnable.value;
  bool get ifPremium => _ifPremium.value;
  bool get isLoading => _isLoading.value;
  Plan get plan => _plan.value;

  List get storeProduct => _storeProduct;

  // Setters
  set isNotificationEnable(value) => _isNotificationEnable.value = value;
  set ifPremium(value) => _ifPremium.value = value;
  set isLoading(value) => _isLoading.value = value;
  set plan(value) => _plan.value = value;

  set storeProduct(value) => _storeProduct.value = value;

  // Functions
  Future fetchProducts() async {
    try {
      final offerings = await Purchases.getOfferings();
      Offering? offering = offerings.current;
      if (offering != null) {
        // Look for the package with a trial period
        Package? trialPackage = offering.getPackage('\$rc_weekly');
        debugPrint('trialPackage: $trialPackage');

        if (trialPackage != null) {
          StoreProduct storeProduct = trialPackage.storeProduct;
          _storeProduct.add(storeProduct);

          debugPrint(
              'Free Product title: ${storeProduct.discounts?.first.price}');
          debugPrint(
              'Free Product price: ${storeProduct.discounts?.first.priceString}');
          debugPrint(
              'Free Product duration: ${storeProduct.discounts?.first.period}'); // Should show 3 days
        }

        // Look for the package with a price
        Package? paidPackage = offering.getPackage('\$rc_annual');
        debugPrint('paidPackage: $paidPackage');

        if (paidPackage != null) {
          StoreProduct storeProduct = paidPackage.storeProduct;
          _storeProduct.add(storeProduct);

          debugPrint('Paid Product title: ${storeProduct.title}');
          debugPrint('Paid Product price: ${storeProduct.priceString}');
          debugPrint(
              'Paid Product duration: ${storeProduct.introductoryPrice?.period}'); // Should show 3 days
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future purchaseProduct(StoreProduct storeProduct) async {
    isLoading = true;
    try {
      final customerInfo = await Purchases.purchaseStoreProduct(storeProduct);

      // Access customer information to verify the active subscriptions
      if (customerInfo.activeSubscriptions.isNotEmpty) {
        debugPrint("User successfully subscribed with free trial!");
        ifPremium = true;
        LocalStorage.addData(isPremium, true);
        isLoading = false;
        Get.back();
        Get.snackbar('', '',
            icon: const Icon(Icons.done),
            shouldIconPulse: true,
            titleText: const Text(
              'Success',
              style: TextStyle(
                  fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
            ),
            messageText: const Text(
              'Subscription purchase successfully !',
              style: TextStyle(fontSize: 14, color: textColor),
            ),
            backgroundColor: primaryColor,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        isLoading = false;
      }

      debugPrint('customerInfo while purchase: $customerInfo');
    } on PlatformException catch (e) {
      debugPrint('error: $e');
      isLoading = false;
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        debugPrint('PurchasesErrorCode.purchaseCancelledError');
      }
    }
  }

  Future restorePurchases() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    try {
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      debugPrint('customerInfo while restore: $customerInfo');

      // Check if the user has the required entitlement
      ifPremium = customerInfo.entitlements.active.containsKey(entitlementID);

      if (ifPremium) {
        isLoading = false;
        // Grant access to premium tracking features
        // (e.g., update UI or store the entitlement state locally)
        LocalStorage.addData(isPremium, true);
        Get.back();
        Get.snackbar('', '',
            icon: const Icon(Icons.done),
            shouldIconPulse: true,
            titleText: const Text(
              'Success',
              style: TextStyle(
                  fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
            ),
            messageText: const Text(
              'Subscription restored successfully !',
              style: TextStyle(fontSize: 14, color: textColor),
            ),
            backgroundColor: primaryColor,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        isLoading = false;
        Get.snackbar('', '',
            icon: const Icon(Icons.error),
            shouldIconPulse: true,
            titleText: const Text(
              'Failed',
              style: TextStyle(
                  fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
            ),
            messageText: const Text(
              'Subscription not found !',
              style: TextStyle(fontSize: 14, color: textColor),
            ),
            backgroundColor: primaryColor,
            snackPosition: SnackPosition.BOTTOM);
      }
    } on PlatformException catch (e) {
      isLoading = false;
      debugPrint('error: $e');
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode == PurchasesErrorCode.receiptAlreadyInUseError) {
        debugPrint('PurchasesErrorCode.receiptAlreadyInUseError');
      }
      if (errorCode == PurchasesErrorCode.missingReceiptFileError) {
        debugPrint('PurchasesErrorCode.missingReceiptFileError');
      }
    }
  }
}
