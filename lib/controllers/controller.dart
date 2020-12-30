import 'package:get/get.dart';

class Controller extends GetxController {
  RxInt _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;
  void changeTabIndex(int newIndex) {
    _tabIndex.value = newIndex;
  }
}
