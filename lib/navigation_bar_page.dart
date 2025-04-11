import 'package:flutter/material.dart';

class NavigationBarPage extends StatelessWidget {
  final String text;
  final Color color;

  const NavigationBarPage({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "Willkommen im Menü: $text.                          Klick doch einfach mal auf einen der Buttons unten in der NavBar.",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
