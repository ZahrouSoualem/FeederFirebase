import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:untitled/Cart/view/cartscreen.dart';
import '/../Home/view/homescreen.dart';
import '/../constant.dart';
import '/../Favourite//view/favouritescreen.dart';
import 'controller/dashboardcontroller.dart';

class DashboardPage extends StatelessWidget {
  static const pageName = '/dashboard';
  var pages = [
    HomeScreen(),
    CartScreen(),
    FavScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardCntroller>(
        init: DashBoardCntroller() ,
        builder: (controller) {
      return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              // the index will be automatically passed to changeSelectedIndex
              onTap: controller.changeSelectedIndex,
              currentIndex: controller.selectedindex,
              selectedItemColor: kPinkColors,
              unselectedItemColor: Colors.black38,
              backgroundColor: kLightPinkColors,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: 'Shoppin Cart'),
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.heartOutline), label: 'Favourite'),
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.bellOutline), label: 'Notificatio'),
              ],
            ),
          ),
        ),
        body: pages[controller.selectedindex],
      );
    });
  }
}

// SafeArea(
// child: IndexedStack(
// index: controller.tabIndex,
// children: [
// HomeScreen(),
// BuyPage(),
// HomeScreen(),
// BuyPage(),
// ],
// ),
// ),

// Padding(
// padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
// child: Container(
// height: 70,
// decoration: BoxDecoration(
// color: kLightPinkColors,
// borderRadius: BorderRadius.circular(20),
// ),
// child: Row(
// children: [
// NavBarIcons(
// icons: Icon(MdiIcons.home),
// ),
// NavBarIcons(
// icons: Icon(Icons.shopping_cart_outlined),
// ),
// NavBarIcons(
// icons: Icon(MdiIcons.heartOutline),
// ),
// NavBarIcons(
// icons: Icon(MdiIcons.bellOutline),
// ),
// ],
// ),
// ),
// ),
