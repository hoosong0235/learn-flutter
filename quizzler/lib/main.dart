import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'lib.dart';

int QUIZ_NUM = 16;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Body(),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int num = 0;
  IconList iconList = IconList();
  QuizGenerator quizGenerator = QuizGenerator();

  TextButton textButton(bool type) {
    late Color color;
    late String string;

    if (type) {
      color = Colors.green;
      string = 'True';
    } else {
      color = Colors.red;
      string = 'False';
    }

    return TextButton(
      onPressed: () {
        check(type);
        if (quizGenerator.indexQuiz >= QUIZ_NUM) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.info,
            text: '$num/$QUIZ_NUM\nRestart?',
          );

          num = 0;
          iconList.initialize();
          quizGenerator.initialize();
        }
        quizGenerator.generate();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: color,
        child: Center(
          child: Text(string,
              style: TextStyle(color: Colors.white, fontSize: 15.0)),
        ),
      ),
    );
  }

  void check(bool pressed) {
    setState(() {
      if (pressed) {
        if (quizGenerator.quiz.answer()) {
          num++;
          iconList.iconList.add(Icon(Icons.check, color: Colors.green));
        } else
          iconList.iconList.add(Icon(Icons.check, color: Colors.red));
      } else {
        if (quizGenerator.quiz.answer())
          iconList.iconList.add(Icon(Icons.close, color: Colors.red));
        else {
          num++;
          iconList.iconList.add(Icon(Icons.close, color: Colors.green));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Center(
            child: Text(quizGenerator.quiz.question(),
                style: TextStyle(color: Colors.white, fontSize: 25.0)),
          ),
        ),
        Expanded(flex: 2, child: textButton(true)),
        Expanded(flex: 2, child: textButton(false)),
        Expanded(child: Row(children: iconList.iconList)),
      ],
    );
  }
}
