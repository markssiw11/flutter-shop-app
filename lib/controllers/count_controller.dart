import 'package:get/get.dart';


class CountController extends GetxController {
  RxInt count = 1.obs;
  void increment() {
    count++;
  }

  void decrement() {
    if (count > 1) count--;
  }
}
