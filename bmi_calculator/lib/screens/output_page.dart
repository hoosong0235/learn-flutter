import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/constants.dart';

class OutputPage extends StatefulWidget {
  final String string_1;
  final String string_2;

  const OutputPage({
    super.key,
    required this.string_1,
    required this.string_2,
  });

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 15.0),
                Text(
                  'RESULT',
                  style: kmediumTS.copyWith(fontSize: 33.3),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: ResultCard(
                    string_1: widget.string_1,
                    string_2: widget.string_2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.blue.shade400,
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('RE-CALCULATE', style: kmediumTS),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
