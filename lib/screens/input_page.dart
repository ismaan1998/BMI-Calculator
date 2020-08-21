

import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/components/gender_enum.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

import '../components/bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../components/content_icon.dart';
import 'results_page.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male
                    ? activeCardColour
                    : inActiveCardColour,
                cardChild:
                    IconContent(icon: FontAwesomeIcons.male, text: "MALE"),
              )),
              Expanded(
                  child: ReusableCard(
                onPressed: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female
                    ? activeCardColour
                    : inActiveCardColour,
                cardChild:
                    IconContent(icon: FontAwesomeIcons.female, text: "FEMALE"),
              )),
            ],
          )),

          //slider for height
          Expanded(
              child: ReusableCard(
            colour: activeCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: numberTextStyle),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  //changing slider theme properties
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    thumbColor: Colors.blueAccent,
                    activeTrackColor: Colors.white,
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: minHeight,
                    max: maxHeight,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),

          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),

              //age section
              Expanded(
                  child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: labelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {

              Calculator calc = Calculator(height: height, weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResults: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  )));
            },
          ),
        ],
      ),
    );
  }
}


