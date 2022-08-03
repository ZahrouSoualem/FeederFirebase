import 'package:flutter/material.dart';

import '../../../constant.dart';



class TheHeader extends StatelessWidget {
   TheHeader({
    Key? key,
    required this.title,
    required this.descreption,
  }) : super(key: key);

  final String title;
  final String descreption;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kTextBoldTitle16.copyWith(fontSize: 30),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          descreption,
          style: klableTextStyle.copyWith(
              fontSize: 13, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    );
  }
}
