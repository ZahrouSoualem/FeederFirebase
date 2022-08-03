import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constant.dart';
import '../../services/authservice.dart';


class ReuseableQuestion extends StatelessWidget {
  ReuseableQuestion({
    Key? key,
    required this.question,
    required this.title,
  }) : super(key: key);

  final String question;
  final String title;
  final autheService = Get.find<AuthToApp>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          /*'Have an account ?'*/ question,
          style: klableTextStyle.copyWith(
              fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        GestureDetector(
          onTap: (){
            autheService.goTo();
          },
          child: Text(
            title,
            style: const TextStyle(
              color: kPinkColors,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
