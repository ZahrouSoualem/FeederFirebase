import 'package:flutter/material.dart';

const Color kPinkColors = Color(0xFFEE3543);
const Color  kLightPinkColors=Color(0xFFF9F0F1);
const Color kScaffoldColor=Color(0xFFF6F6F6);
const Color kLabeleColor=Color(0xFFB9B9B9);
const Color kgreyColor = Color(0xFFF5F5F5);
const ktextlable =  TextStyle(color: kLabeleColor, fontSize: 10,);
const ktextBold = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);



//Padding
const EdgeInsetsGeometry kpadding5 = EdgeInsets.all(15);


//BorderRduis for containers

const kBorderRdiusForbottomButton = BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
);

//Text
const kTextBoldTitle16 =TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const klableTextStyle = TextStyle(
  color: kLabeleColor,
  fontSize: 12,
);


//TextFormField Decoration

InputDecoration kNameDecoration = InputDecoration(
  hintText: 'Your name',
  filled: true,
  fillColor: kgreyColor,
  contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26),
  ),
  border: OutlineInputBorder(
    borderRadius:  BorderRadius.circular(5),
  ),
);



InputDecoration kEmailDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
  hintText: 'Your Email',
  filled: true,
  fillColor: kgreyColor,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);



InputDecoration kPasswordDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
  suffixIcon: Icon(Icons.visibility_outlined),
  hintText: 'Your Password',
  filled: true,
  fillColor: kgreyColor,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);