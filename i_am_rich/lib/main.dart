import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I Am Rich'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey,
        body: const Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
