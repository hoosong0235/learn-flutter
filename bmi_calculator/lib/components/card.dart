import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/constants.dart';

class IconCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String string;
  final GestureTapCallback onTap;
  final PointerEnterEventListener onEnter;
  final PointerExitEventListener onExit;

  const IconCard({
    super.key,
    required this.color,
    required this.icon,
    required this.string,
    required this.onTap,
    required this.onEnter,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 75.0, color: Colors.white),
              const SizedBox(height: 15.0),
              Text(string, style: ksmallTS),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  final Color color;
  final double value;
  final ValueChanged<double> onChanged;
  final ValueChanged<double> onChangeEnd;

  const SliderCard({
    super.key,
    required this.color,
    required this.value,
    required this.onChanged,
    required this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('HEIGHT', style: ksmallTS),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value.round().toString(), style: klargeTS),
              const Text('CM', style: ksmallTS)
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 0.5,
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white,
            ),
            child: Slider(
                value: value,
                min: 120.0,
                max: 220.0,
                onChanged: onChanged,
                onChangeEnd: onChangeEnd),
          ),
        ],
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  final String string_1;
  final String string_2;
  final Color color;
  final int value;
  final VoidCallback onPressedLeft;
  final VoidCallback onPressedRight;

  const ButtonCard({
    super.key,
    required this.string_1,
    required this.string_2,
    required this.color,
    required this.value,
    required this.onPressedLeft,
    required this.onPressedRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(string_1, style: ksmallTS),
            const SizedBox(height: 2.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(value.toString(), style: klargeTS),
                Text(string_2, style: ksmallTS)
              ],
            ),
            const SizedBox(height: 5.0),
            ElevatedButtonTheme(
              data: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(17.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onPressedLeft,
                    child: const Icon(FontAwesomeIcons.minus),
                  ),
                  const SizedBox(width: 2.5),
                  ElevatedButton(
                    onPressed: onPressedRight,
                    child: const Icon(FontAwesomeIcons.plus),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class ResultCard extends StatelessWidget {
  final String string_1;
  final String string_2;

  const ResultCard({
    super.key,
    required this.string_1,
    required this.string_2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(string_1, style: ksmallTS),
          const SizedBox(height: 50.0),
          Text(string_2, style: klargeTS),
          const SizedBox(height: 50.0),
          const Text('Description', style: ksmallTS),
        ],
      ),
    );
  }
}
