import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'file:///D:/AndroidStudioProjects/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResults;
  final String resultText;
  final String interpretation;

  ResultsPage({@required this.interpretation, @required this.bmiResults, @required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResults,
                    style: bmiTextStyle,
                  ),
                  Text(interpretation,
                      style: bodyTextStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
          onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
