// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;

  final Widget? cardChild;
  final Function? onPress;

  // ignore: prefer_const_constructors_in_immutables
  ReusableCard({required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onPress?.call()},
      child: Container(
        child: cardChild,
        height: 180,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
