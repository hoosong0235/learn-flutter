import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: Text('Dicee'),
          ),
          body: DicePage(),
        ),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 25.0,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        left = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$left.png')),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        right = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$right.png')),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
          Text(
            'Sum = ' + (left + right).toString(),
            style: textStyle,
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: 150.0,
            height: 50.0,
            color: Colors.redAccent,
            child: TextButton(
              onPressed: () {
                setState(() {
                  left = Random().nextInt(6) + 1;
                  right = Random().nextInt(6) + 1;
                });
              },
              child: Text(
                'ROLL',
                style: textStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
