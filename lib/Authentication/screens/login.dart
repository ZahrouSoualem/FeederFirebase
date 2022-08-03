import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/constant.dart';

import '../services/authservice.dart';
import 'ReusableComponents/reusablequestion.dart';
import 'ReusableComponents/reuseabletextfield.dart';
import 'ReusableComponents/theheader.dart';

class LogIn extends StatelessWidget {
  static final pageName = '/Login';
  LogIn({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
   final authService = Get.find<AuthToApp>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.all(width * 0.06),
            children: [
              SizedBox(
                height: height / 7,
              ),
              TheHeader(
                title: 'Log In',
                descreption: 'Sign In and choose favourite food',
              ),
              ReusableTitleTField(
                  isObsecured: false,
                  fieldName: 'Email',
                  height: height,
                  function: (value) {
                    // const String patter =
                    //     "[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2, 4}\$";
                    // if (value!.isEmpty || value.length < 6) {
                    //   return "Please enter your email ";
                    // } else if (!RegExp(patter).hasMatch(value)) {
                    //   return "Please enter a valid email";
                    // } else {
                    //   return null;
                    // }
                    if (value!.isEmpty) {
                      return "password must be at least 7 characters ";
                    } else {
                      email = value;
                    }
                  },
                  inputDecoration: kEmailDecoration),
              SizedBox(
                height: height * 0.015,
              ),
              ReusableTitleTField(
                  isObsecured: true,
                  fieldName: 'Password',
                  height: height,
                  function: (value) {
                    // if (value!.isEmpty) {
                    //   return "Please enter your password ";
                    // } else if (value.length < 7) {
                    //   return "password must be at least 7 characters ";
                    // } else {
                    //   print(email);
                    //   print(password);
                    //   return null;
                    // }
                    if (value!.length < 7) {
                      return "password must be at least 7 characters ";
                    } else {
                      password = value;
                      print(password + ' ' + email);
                    }
                  },
                  inputDecoration: kPasswordDecoration),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width,
                height: height * 0.07,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await authService.signInWithEmailAndPassword(email, password);
                    }
                  },
                  child: Text("Log In"),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ReuseableQuestion(
                  question: 'Do not you have an account',
                  title: 'Sign Up',),
              SizedBox(
                height: height / 7,
              ),
              GestureDetector(
                child: const Center(
                  child: Text(
                    "Terms and Policy",
                    style: TextStyle(
                      color: kPinkColors,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
