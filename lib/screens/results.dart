// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/components/reusabale_card.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalculatorBrain calc =
        ModalRoute.of(context)!.settings.arguments as CalculatorBrain;
    return Scaffold(
      appBar: AppBar(
        title: Text(' BMI CAlCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                child: ReusableCard(
                  colour: kactivecardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        calc.getResult().toUpperCase(),
                        style: kresultStyle,
                      ),
                      Text(
                        calc.calculateBMI(),
                        style: kBmiTextStyle,
                      ),
                      Text(
                        calc.getInterpretation(),
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ),
              )),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () => {Navigator.pop(context)},
          )
        ],
      ),
    );
  }
}
