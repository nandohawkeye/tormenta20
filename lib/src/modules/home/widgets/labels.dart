import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(fontSize: 24, fontFamily: 'tormenta'),
    );
  }
}
