import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  void name() => name.obs;
  increment() => count++;
  var amountController = 0.obs;
  addAmount() => amountController++;
  void addTotalPrice(double double) {}

}

class NumberController extends GetxController {
  var count = 0.obs;

  void updateCount(int newCount) {
    count.value = newCount;
  }

  void increment() => count.value++;

}
