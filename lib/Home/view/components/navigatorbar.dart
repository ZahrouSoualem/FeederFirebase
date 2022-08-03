import 'package:flutter/material.dart';

class NavBarIcons extends StatelessWidget {
  final Icon icons;
  NavBarIcons({required this.icons});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //height: 80,
        //width: MediaQuery.of(context).size.width/4,
        //color: kLightPinkColors,
        child: icons,
      ),
    );
  }
}