import 'package:get/get.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  // Private variables
  final RxBool _isNotificationEnable = true.obs;
  final RxBool _isFreeTrialEnable = true.obs;

  // Getters
  bool get isNotificationEnable => _isNotificationEnable.value;
  bool get isFreeTrialEnable => _isFreeTrialEnable.value;

  // Setters
  set isNotificationEnable(value) => _isNotificationEnable.value = value;
  set isFreeTrialEnable(value) => _isFreeTrialEnable.value = value;
}
