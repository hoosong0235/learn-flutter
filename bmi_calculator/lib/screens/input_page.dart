import 'package:bmi_calculator/screens/output_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/bmi_calculator.dart';

enum Gender {
  none,
  male,
  female,
}

final Color shade200CC = Colors.blue.shade200;
final Color shade300CC = Colors.blue.shade300;
final Color shade400CC = Colors.blue.shade400;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color marsIconCC = shade200CC;
  Color venusIconCC = shade200CC;
  Color heightCC = shade200CC;
  Color weightCC = shade200CC;
  Color ageCC = shade200CC;
  double height = 160.0;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: IconCard(
                    color: marsIconCC,
                    icon: FontAwesomeIcons.mars,
                    string: 'MALE',
                    onTap: () => setState(
                      () {
                        if (marsIconCC != shade400CC) {
                          marsIconCC = shade400CC;
                          venusIconCC = shade200CC;
                        } else {
                          marsIconCC = shade200CC;
                        }
                      },
                    ),
                    onEnter: (event) => setState(() {
                      if (marsIconCC != shade400CC) marsIconCC = shade300CC;
                    }),
                    onExit: (event) => setState(() {
                      if (marsIconCC != shade400CC) marsIconCC = shade200CC;
                    }),
                  ),
                ),
                Expanded(
                  child: IconCard(
                    color: venusIconCC,
                    icon: FontAwesomeIcons.venus,
                    string: 'FEMALE',
                    onTap: () => setState(
                      () {
                        if (venusIconCC != shade400CC) {
                          venusIconCC = shade400CC;
                          marsIconCC = shade200CC;
                        } else {
                          venusIconCC = shade200CC;
                        }
                      },
                    ),
                    onEnter: (event) => setState(() {
                      if (venusIconCC != shade400CC) venusIconCC = shade300CC;
                    }),
                    onExit: (event) => setState(() {
                      if (venusIconCC != shade400CC) venusIconCC = shade200CC;
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SliderCard(
              color: heightCC,
              value: height,
              onChanged: (height) => setState(() => this.height = height),
              onChangeEnd: (height) => setState(() => heightCC = shade400CC),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ButtonCard(
                    string_1: 'WEIGHT',
                    string_2: 'KG',
                    color: weightCC,
                    value: weight,
                    onPressedLeft: () => setState(() {
                      weightCC = shade400CC;
                      weight--;
                    }),
                    onPressedRight: () => setState(() {
                      weightCC = shade400CC;
                      weight++;
                    }),
                  ),
                ),
                Expanded(
                  child: ButtonCard(
                    string_1: 'AGE',
                    string_2: '',
                    color: ageCC,
                    value: age,
                    onPressedLeft: () => setState(() {
                      ageCC = shade400CC;
                      age--;
                    }),
                    onPressedRight: () => setState(() {
                      ageCC = shade400CC;
                      age++;
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    BmiCalculator bmiCalculator =
                        BmiCalculator(height: height, weight: weight);
                    String string_1 = bmiCalculator.output();
                    String string_2 =
                        bmiCalculator.calculate().toStringAsFixed(1);
                    return OutputPage(string_1: string_1, string_2: string_2);
                  },
                ),
              ),
              child: Container(
                color: Colors.blue.shade400,
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('CALCULATE', style: kmediumTS),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
