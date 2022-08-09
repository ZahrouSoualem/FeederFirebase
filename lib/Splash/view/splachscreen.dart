import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/authentication/services/authservice.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/Wrapper/wrapper.dart';

class SplachScreen extends StatelessWidget {
  SplachScreen({Key? key}) : super(key: key);
  static const String pageName = '/Splach';

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 6),
      () {
        Get.offNamed(Wrapper.pageName);
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset(
                "assets/images/illustrations/svg/logos.png",
                fit: BoxFit.scaleDown,
              ),
            ),
            const Text(
              'FEEDER',
              style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: kPinkColors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Image.asset("assets/images/illustrations/svg/logos.png",fit: BoxFit.scaleDown,)

// SvgPicture.asset(
// 'assets/images/illustrations/svg/logos.svg',
// fit: BoxFit.fitHeight,
// alignment: Alignment.center,
// )
