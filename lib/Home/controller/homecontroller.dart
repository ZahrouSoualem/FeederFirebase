import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt slectedIndex = 0.obs;


  RxInt CategoryIndex = 0.obs;

  setSelectIndex(var index) {
    slectedIndex = index;
  }

}
