import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  // Private variables
  final RxInt _currentIndex = 0.obs;
  final RxInt _iconIndex = 0.obs;

  // Getters
  int get currentIndex => _currentIndex.value;
  int get iconIndex => _iconIndex.value;

  // Setters
  set currentIndex(value) => _currentIndex.value = value;
  set iconIndex(value) => _iconIndex.value = value;
}
