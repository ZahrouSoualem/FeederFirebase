import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constant.dart';
import '../services/authservice.dart';
import 'ReusableComponents/reusablequestion.dart';
import 'ReusableComponents/reuseabletextfield.dart';
import 'ReusableComponents/theheader.dart';

class SignUp extends StatelessWidget {
  static const pageName = '/Signup';

  final autheService = Get.find<AuthToApp>();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                title: 'Sign Up',
                descreption: 'Create account and choose favourite food',
              ),
              // ReusableTitleTField(
              //     isObsecured: false,
              //     fieldName: 'Name',
              //     height: height,
              //     function: (value) {
              //       if (value != null) {
              //         if (value.isEmpty) {
              //           return 'Please Enter you name';
              //         }
              //       } else {
              //         return null;
              //       }
              //     },
              //     inputDecoration: kNameDecoration),
              // SizedBox(
              //   height: height * 0.015,
              // ),
              ReusableTitleTField(
                isObsecured: false,
                fieldName: 'Email',
                height: height,
                function: (value) {
                  // const String patter =
                  //     "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                  // if (value != null) {
                  //   if (value.isEmpty || value.length < 6) {
                  //     return "Please enter your email ";
                  //   } else if (!RegExp(patter).hasMatch(value)) {
                  //     return "Please enter a valid email";
                  //   }else{
                  //     email = value;
                  //     return null;
                  //   }
                  // }

                  if (value!.isEmpty) {
                    return "Please enter your email ";
                  } else {
                    email = value;
                    return null;
                  }
                },
                inputDecoration: kEmailDecoration,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              ReusableTitleTField(
                isObsecured: true,
                fieldName: 'Password',
                height: height,
                function: (value) {
                  // const String patter =
                  //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  // if (value != null) {
                  //   if (value.isEmpty) {
                  //     return "Please enter your password ";
                  //   } else if (value.length < 7) {
                  //     return "password must be at least 7 characters ";
                  //   } else if (!RegExp(patter).hasMatch(value)) {
                  //     return "Your Password is not strong enough";
                  //   }
                  // } else if (value!.isEmpty) {
                  //   return "Please enter your password ";
                  // } else {
                  //   return "Please enter your password ";
                  //   return null;
                  // }
                  if (value!.length < 7) {
                    return "password must be at least 7 characters ";
                  } else {
                    password = value;
                    print(password + ' ' + email);
                  }
                },
                inputDecoration: kPasswordDecoration,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width,
                height: height * 0.07,
                child: ElevatedButton(
                  onPressed: () async {

                    if (_formkey.currentState!.validate()) {
                      await autheService.registerWithEmailAndPassword(email, password);
                    }
                  },
                  child: Text('Register'),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ReuseableQuestion(
                question: 'Do you have an account',
                title: 'Log In',
              ),
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
