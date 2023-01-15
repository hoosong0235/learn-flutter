import 'dart:math';
import 'package:flutter/material.dart';

class BmiCalculator extends StatelessWidget {
  final double height;
  final int weight;

  const BmiCalculator({
    super.key,
    required this.height,
    required this.weight,
  });

  double calculate() {
    return weight / pow(height / 100, 2);
  }

  String output() {
    double bmi = calculate();
    if (bmi > 25) {
      return 'OVERWEIGHTED';
    } else if (bmi > 15) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHTED';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
