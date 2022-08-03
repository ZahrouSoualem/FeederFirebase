import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/Authentication/screens/login.dart';
import 'package:untitled/Authentication/screens/signup.dart';
import 'package:untitled/Authentication/services/authservice.dart';




class Goto extends StatelessWidget {
   Goto({Key? key}) : super(key: key);
   static final pageName = '/Goto';
  final authService = Get.find<AuthToApp>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=> authService.goto.value ? LogIn():SignUp());
  }
}
