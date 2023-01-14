import 'package:flutter/material.dart';
import 'dart:math';

class Quiz {
  late String _question;
  late bool _answer;

  Quiz(q, a) {
    this._question = q;
    this._answer = a;
  }

  String question() {
    return this._question;
  }

  bool answer() {
    return this._answer;
  }
}

class QuizGenerator {
  late Quiz quiz;
  int indexQuiz = 0;

  QuizGenerator() {
    this.generate();
  }

  void generate() {
    bool answer = Random().nextBool();

    this.indexQuiz++;
    this.quiz = Quiz('$indexQuiz. $answer quiz', answer);
  }

  void initialize() {
    this.indexQuiz = 0;
  }
}

class IconList {
  List<Icon> iconList = [];

  void initialize() {
    this.iconList = [];
  }
}
