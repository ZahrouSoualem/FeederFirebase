import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../services/authservice.dart';

class ReuseableButton extends StatelessWidget{
  ReuseableButton({
    Key? key,
    required this.title,
    required GlobalKey<FormState> formkey,
    required this.authFunction
  })  : _formkey = formkey,
        super(key: key);

  final String title;
  final GlobalKey<FormState> _formkey;
  final Future<dynamic> authFunction;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height * 0.07,
      child: ElevatedButton(
          onPressed: () async {
            if (_formkey.currentState!.validate()) {
              await AuthToApp().registerWithEmailAndPassword("zahrousoualemess@gmail.com", "password");
            }
          },
          child: Text(title),
        ),
    );
  }
}