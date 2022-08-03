
import 'package:get/get.dart';

class DashBoardCntroller extends GetxController{
  var tabIndex= 0;
  int selectedindex=0;

  void changeTabIndex(var index){
    tabIndex=index;
    update();
  }

  void changeSelectedIndex(var index){
    selectedindex=index;
    update();
  }


}