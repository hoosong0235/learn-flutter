import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card.dart';

enum Gender {
  none,
  male,
  female,
}

final Color inactiveCC = Colors.blue.shade200;
final Color activeCC = Colors.blue.shade400;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;

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
                      color:
                          selectedGender == Gender.male ? activeCC : inactiveCC,
                      icon: FontAwesomeIcons.mars,
                      string: 'MALE',
                      onTap: () => setState(() => selectedGender == Gender.male
                          ? selectedGender = Gender.none
                          : selectedGender = Gender.male)),
                ),
                Expanded(
                  child: IconCard(
                      color: selectedGender == Gender.female
                          ? activeCC
                          : inactiveCC,
                      icon: FontAwesomeIcons.venus,
                      string: 'FEMALE',
                      onTap: () => setState(() =>
                          selectedGender == Gender.female
                              ? selectedGender = Gender.none
                              : selectedGender = Gender.female)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: WidgetCard(
              color: inactiveCC,
              child: Container(),
              onTap: () {},
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: WidgetCard(
                    color: inactiveCC,
                    child: Container(),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: WidgetCard(
                    color: inactiveCC,
                    child: Container(),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue.shade400,
              margin: const EdgeInsets.only(top: 10.0),
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
