import 'package:get/get.dart';

enum Plan { FREE, PAID }

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  // Private variables
  final RxBool _isNotificationEnable = true.obs;
  final RxBool _isFreeTrialEnable = true.obs;
  final _plan = Plan.FREE.obs;

  // Getters
  bool get isNotificationEnable => _isNotificationEnable.value;
  bool get isFreeTrialEnable => _isFreeTrialEnable.value;
  Plan get plan => _plan.value;

  // Setters
  set isNotificationEnable(value) => _isNotificationEnable.value = value;
  set isFreeTrialEnable(value) => _isFreeTrialEnable.value = value;
  set plan(value) => _plan.value = value;
}
