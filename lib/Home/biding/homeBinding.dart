import 'package:get/get.dart';
import '../../Cart/controller/cartcontroller.dart';
import '/../../Favourite/controller/favouritecontroller.dart';
import '../../Product/controller/productcontroller.dart';
import '../controller/database.dart';
import '../controller/homecontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeController());
    Get.put(Database());
    Get.put(ProductController());
    //Get.put(FavouriteController());
    Get.put(OrderController());
    Get.put(FavouriteController());
    //Get.put(AuthToApp());
  }
}
