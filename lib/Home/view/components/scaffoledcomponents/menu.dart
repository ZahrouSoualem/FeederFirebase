import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/Authentication/screens/login.dart';
import 'package:untitled/Wrapper/wrapper.dart';

import '../../../../Authentication/services/authservice.dart';


class Menu extends StatelessWidget {
  //  const Menu({
  //   Key? key,
  // }) : super(key: key);

  final autheService = Get.find<AuthToApp>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        children: [
          ListTile(
            title: const Text('Profile'),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,) ,
            onTap: () {
              // Update the state of the app.
              // ...
              Get.back();
            },
          ),
          ListTile(
            title: const Text('Home'),
            leading: Icon(Icons.home_rounded),
            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,) ,

            onTap: () {
              // Update the state of the app.
              // ...
              Get.back();
            },
          ),
          ListTile(
            title: const Text('Your Orders'),
            leading: Icon(Icons.shopping_cart_rounded),
            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,) ,

            onTap: () {
              // Update the state of the app.
              // ...
              Get.back();
            },
          ),
          ListTile(
            title: const Text('Setting'),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,) ,

            onTap: () {
              // Update the state of the app.
              // ...
              Get.back();
            },
          ),
          SizedBox(height: height*0.06,),
          ListTile(
            title: const Text('Log out'),
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,) ,

            onTap: () async {
             await autheService.LogOut();
             Get.offAllNamed(Wrapper.pageName);
            },
          ),
          SizedBox(height: height*0.06,),
          Divider(thickness: 2,),
          ListTile(
            title: const Text('Help & Support'),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,) ,

            onTap: () {
              // Update the state of the app.
              // ...
              Get.back();
            },
          ),

        ],
      ),
    );
  }
}
