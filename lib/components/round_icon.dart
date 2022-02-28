// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icons;
  final Function onPressed;

  RoundIconButton({required this.icons, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed.call(),
      child: Icon(icons),
      constraints: BoxConstraints.tightFor(
        width: 54.0,
        height: 54.0,
      ),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
