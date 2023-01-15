import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WidgetCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final GestureTapCallback onTap;

  const WidgetCard({
    super.key,
    required this.color,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}

class IconCard extends WidgetCard {
  final IconData icon;
  final String string;

  IconCard({
    super.key,
    required color,
    required this.icon,
    required this.string,
    required onTap,
  }) : super(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 75.0, color: Colors.white),
              const SizedBox(height: 15.0),
              Text(string, style: const TextStyle(color: Colors.white)),
            ],
          ),
          onTap: onTap,
        );
}
