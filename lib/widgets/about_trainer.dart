import 'package:flutter/material.dart';

class AboutTrainer extends StatelessWidget {
  final String trainerName;
  final String trainerType;

  const AboutTrainer({
    super.key,
    required this.trainerName,
    required this.trainerType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(trainerName, style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: 14),
        Text(
          trainerType,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Color.fromARGB(204, 32, 32, 32),
          ),
        ),
      ],
    );
  }
}
