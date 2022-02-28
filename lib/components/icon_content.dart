// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants.dart';

class IconWidget extends StatelessWidget {
  final IconData genderIcon;
  final String gendername;

  // ignore: prefer_const_constructors_in_immutables
  IconWidget(this.genderIcon, this.gendername);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(gendername, style: klabelTextStyle)
      ],
    );
  }
}
