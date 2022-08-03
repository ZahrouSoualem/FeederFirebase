
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:untitled/Home/controller/homecontroller.dart';

import '../../Cart/controller/cartcontroller.dart';
import '../../Favourite/controller/favouritecontroller.dart';
import '../../Home/controller/database.dart';
import '../../Product/controller/productcontroller.dart';
import '../controller/dashboardcontroller.dart';

class DashboardBiding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DashBoardCntroller());
    Get.put(HomeController());
    Get.put(OrderController());
    Get.put(Database());
    Get.put(ProductController());
    Get.put(FavouriteController());
  }

}