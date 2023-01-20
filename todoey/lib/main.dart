import 'package:flutter/material.dart';
import 'package:todoey/screen.dart';
import 'package:todoey/todoprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        home: const Screen(),
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          scaffoldBackgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
