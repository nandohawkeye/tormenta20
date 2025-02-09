import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class AboutSettingsUserNameCard extends StatelessWidget {
  const AboutSettingsUserNameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: T20UI.spaceSize - 4),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(T20UI.spaceSize),
              child: Text(
                'Clique aqui para salvar seu nome',
                maxLines: 10,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
