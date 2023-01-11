import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I am Seungho'),
          centerTitle: true,
          backgroundColor: Colors.purple.shade100,
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/seungho.jpg'),
          ),
        ),
        backgroundColor: Colors.purple.shade50,
      ),
    ),
  );
}
