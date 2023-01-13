import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

Expanded block(int num, Color color) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        final player = AudioPlayer();
        player.setAsset('assets/note$num.wav');
        player.play();
      },
      child: Container(
        color: color,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Xylophone'),
          ),
          body: Center(
            child: Column(
              children: [
                block(1, Colors.red),
                block(2, Colors.orange),
                block(3, Colors.yellow),
                block(4, Colors.green),
                block(5, Colors.blue),
                block(6, Colors.indigo),
                block(7, Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
