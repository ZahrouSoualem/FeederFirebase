import 'package:flutter/material.dart';

import '../../../constant.dart';


class ReusableTitleTField extends StatelessWidget {
  const ReusableTitleTField({
    Key? key,
    required this.fieldName,
    required this.height,
    required this.function,
    required this.inputDecoration,
    required this.isObsecured
  }) : super(key: key);

  final String fieldName;
  final double height;
  final String? Function(String? p1)? function;
  final bool isObsecured ;
  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: kTextBoldTitle16.copyWith(fontSize: 13),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        TextFormField(

          cursorHeight: 33,
          validator: /*(value)=> value!.isEmpty? 'Please Enter you name' : null*/ function,
          obscureText: isObsecured,
          decoration: inputDecoration,
        ),
      ],
    );
  }
}