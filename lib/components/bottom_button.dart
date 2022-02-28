// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import '../constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;

  BottomButton({required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle)),
        width: double.infinity,
        color: Color(0xFFEA1556),
        height: kbottomContainer,
      ),
    );
  }
}
