import 'package:flutter/material.dart';

import '../../../../constant.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: kPinkColors,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: height*0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/image_1.jpg"),
            radius:40,
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.03 ,)
          ,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Soualem Zahreddine',style: kTextBoldTitle16.copyWith(color: Colors.white),),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Text('Zahrou001@gmail.com',style: klableTextStyle.copyWith(color: kLightPinkColors),),
              ],
            ),
          )
        ],
      ),
    );
  }
}