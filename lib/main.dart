import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


import 'Authentication/screens/goto.dart';
import 'Authentication/screens/login.dart';
import 'Authentication/screens/signup.dart';
import 'Authentication/services/authservice.dart';
import 'Cart/view/cartscreen.dart';
import 'Home/controller/database.dart';
import 'Profile/view/profilescreen.dart';
import 'Splash/view/splachscreen.dart';
import 'Wrapper/wrapper.dart';
import 'constant.dart';
import 'Product/view/productscreen.dart';
import 'Dashboard/bingding/dashboardbiding.dart';
import 'Dashboard/dashboard.dart';
import 'Favourite/view/favouritescreen.dart';
import 'Home/biding/homeBinding.dart';
import 'Home/view/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthToApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kPinkColors,
        ),
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      initialRoute: SplachScreen.pageName,
      getPages: [
        GetPage(
          name: HomeScreen.pageName,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
            name: DashboardPage.pageName,
            page: () => DashboardPage(),
            binding: DashboardBiding()),
        GetPage(
          name: Profil.pageName,
          page: () => Profil(),
        ),
        GetPage(
          name: LogIn.pageName,
          page: () => LogIn(),
        ),
        GetPage(
          name: SignUp.pageName,
          page: () => SignUp(),
        ),
        GetPage(
            name: Details_Screen.pageName,
            page: () => Details_Screen(
                  product: Database().listProduct[0]!,
                )),
        GetPage(
          name: CartScreen.pageName,
          page: () => CartScreen(),
        ),
        GetPage(
          name: SplachScreen.pageName,
          page: () => SplachScreen(),
        ),
        GetPage(
          name: FavScreen.pageName,
          page: () => FavScreen(),
        ),
        GetPage(
          name: Wrapper.pageName,
          page: () => Wrapper(),
          /*binding: HomeBinding()*/
        ),
        GetPage(
          name: Goto.pageName,
          page: () => Goto(),
        ),
      ],
    );
  }
}
