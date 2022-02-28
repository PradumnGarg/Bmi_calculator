// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:bmi_app/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusabale_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon.dart';

enum Gender { epmty, male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int heightslidebar = 180;
  int weight = 60;
  int age = 19;
  Gender selectedgender = Gender.epmty;

  void selectGender(Gender gender) {
    (gender == selectedgender)
        ? selectedgender = Gender.epmty
        : selectedgender = gender;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('BMI CALCULATOR')),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onPress: () => setState(() {
                      selectGender(Gender.male);
                    }),
                    colour: selectedgender == Gender.male
                        ? kactivecardColor
                        : kinactiveColor,
                    cardChild: IconWidget(FontAwesomeIcons.mars, 'MALE'),
                  )),
                  Expanded(
                      child: ReusableCard(
                          onPress: () => setState(() {
                                selectGender(Gender.female);
                              }),
                          colour: selectedgender == Gender.female
                              ? kactivecardColor
                              : kinactiveColor,
                          cardChild:
                              IconWidget(FontAwesomeIcons.venus, 'FEMALE'))),
                ],
              ),
              Expanded(
                  child: ReusableCard(
                colour: kactivecardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          heightslidebar.toString(),
                          style: knumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: heightslidebar.toDouble(),
                          max: 220,
                          min: 120,
                          onChanged: (double newvalue) {
                            setState(() {
                              heightslidebar = newvalue.round();
                            });
                          }),
                    )
                  ],
                ),
              )),
              Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          colour: kactivecardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: klabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: knumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icons: FontAwesomeIcons.minus,
                                    onPressed: () => {
                                      setState(() {
                                        weight--;
                                      })
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  RoundIconButton(
                                    icons: FontAwesomeIcons.plus,
                                    onPressed: () => {
                                      setState(() {
                                        weight++;
                                      })
                                    },
                                  ),
                                ],
                              )
                            ],
                          ))),
                  Expanded(
                      child: ReusableCard(
                    colour: kactivecardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icons: FontAwesomeIcons.minus,
                              onPressed: () => {
                                setState(() {
                                  age--;
                                })
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icons: FontAwesomeIcons.plus,
                              onPressed: () => {
                                setState(() {
                                  age++;
                                })
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
              BottomButton(
                  buttonTitle: 'CALCULATE',
                  onTap: () {
                    CalculatorBrain calc =
                        CalculatorBrain(height: heightslidebar, weight: weight);

                    Navigator.pushNamed(context, '/results', arguments: calc);
                  })
            ],
          )),
    );
  }
}
