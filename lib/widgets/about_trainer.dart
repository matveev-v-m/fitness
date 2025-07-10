import 'package:flutter/material.dart';

class AboutTrainer extends StatelessWidget {
  final String trainerName;
  final String trainerType;
  const AboutTrainer({super.key, required this.trainerName, required this.trainerType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(trainerName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        SizedBox(height: 14),
        Text(
          trainerType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(204, 32, 32, 32),
          ),
        ),
      ],
    );
  }
}
