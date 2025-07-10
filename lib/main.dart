import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/our_team_page.dart';
import 'pages/trainer_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Granate",
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(130, 255, 255, 255),
          elevation: 0,
        ),
      ),
      routes: {'/': (context) => OurTeamPage(), '/trainer_page': (context) => TrainerPage()},
    );
  }
}
