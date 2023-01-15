import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
//import 'output_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: FlexThemeData.light(scheme: FlexScheme.flutterDash)
          .copyWith(textTheme: GoogleFonts.nanumGothicTextTheme()),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.flutterDash)
          .copyWith(textTheme: GoogleFonts.nanumGothicTextTheme()),
      themeMode: ThemeMode.system,
    );
  }
}
