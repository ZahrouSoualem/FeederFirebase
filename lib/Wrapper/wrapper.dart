import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:untitled/Dashboard/dashboard.dart';

import '../Authentication/screens/goto.dart';
import '../Authentication/services/authservice.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);
  static final pageName = '/Wrapper';

  //final autheService = Get.put(AuthToApp());
  final autheService = Get.find<AuthToApp>();

  @override
  //AuthToApp().sign ? SignUp() : DashboardPage()
  Widget build(BuildContext context) {
    // return DashboardPage();
    //return Goto();
    return Obx(
      () {
        if (!autheService.isSigned.value) {
          return Goto();
        } else {
          return DashboardPage();
        }
      },
    );
  }
}
