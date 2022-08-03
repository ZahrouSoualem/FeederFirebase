import 'package:flutter/material.dart';

import '../../../constant.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final Function()? function;
  final BorderRadiusGeometry? border;
  QuantityButton(
      {required this.icon, required this.function, required this.border});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:  Material(
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: InkWell(
            onTap: function,
            child: Icon(icon,color: Colors.white,size: 35,),
          ),
        ),
        borderRadius: border,
        color: kPinkColors,
      ),
    );

  }
}
//
// Flexible(
// flex: 3,
// child: Material(
// color: kPinkColors,
// borderRadius: BorderRadius.circular(10),
// child: InkWell(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Icon(
// Icons.add,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// Flexible(
// flex: 1,
// child: TextField(
//
// ),
// ),Flexible(
// flex: 3,
// child: Material(
// color: kPinkColors,
// borderRadius: BorderRadius.circular(10),
// child: InkWell(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Icon(
// Icons.add,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// Flexible(
// flex: 1,
// child: TextField(
//
// ),
// ),