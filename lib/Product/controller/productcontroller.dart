import 'package:get/get.dart';

class ProductController extends GetxController{
  RxInt QuantityCounter = 1.obs;

  setQcounterPlus() {
    QuantityCounter++;
  }

  setQcounterminus() {
    if (QuantityCounter.value > 0) {
      QuantityCounter.value--;
    } else {
      QuantityCounter.value = 0;
    }
  }
}