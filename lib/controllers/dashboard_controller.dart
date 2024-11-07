import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  // Private variables
  final RxInt _currentIndex = 0.obs;

  // Getters
  int get currentIndex => _currentIndex.value;

  // Setters
  set currentIndex(value) => _currentIndex.value = value;
}
