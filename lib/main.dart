import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'generated/l10n.dart';
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
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // supportedLocales: S.delegate.supportedLocales,
      supportedLocales: [const Locale('ru', 'RU'), const Locale('en', 'US')],
      locale: const Locale('ru', 'RU'),
      // locale: const Locale('en', 'US'),
      theme: ThemeData(
        hintColor: Color.fromARGB(200, 26, 26, 26),
        colorScheme: ColorScheme.light(
          primary: Color.fromARGB(255, 30, 111, 254),
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          secondary: Color.fromARGB(255, 174, 199, 241),
          onSecondary: Color.fromARGB(255, 255, 255, 255),
          tertiary: Color.fromARGB(255, 93, 93, 93),
          error: Color.fromARGB(255, 255, 0, 0),
          surface: Color.fromARGB(255, 243, 243, 243),
          outline: Color.fromARGB(255, 174, 199, 241),
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 134, 134, 134)),
        scaffoldBackgroundColor: Color.fromARGB(255, 243, 243, 243),
        fontFamily: "Granate",
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontVariations: [
              FontVariation(
                CustomFontWeight.weight,
                CustomFontWeight.weight550,
              ),
            ],
            fontSize: 24,
          ),
          headlineMedium: TextStyle(
            fontVariations: [
              FontVariation(
                CustomFontWeight.weight,
                CustomFontWeight.weight550,
              ),
            ],
            fontSize: 17,
          ),
          headlineSmall: TextStyle(
            fontVariations: [
              FontVariation(
                CustomFontWeight.weight,
                CustomFontWeight.weight400,
              ),
            ],
            fontSize: 17,
          ),
          titleLarge: TextStyle(
            fontVariations: [
              FontVariation(
                CustomFontWeight.weight,
                CustomFontWeight.weight550,
              ),
            ],
            fontSize: 24,
          ),
          titleMedium: TextStyle(
            fontVariations: [
              FontVariation(
                CustomFontWeight.weight,
                CustomFontWeight.weight400,
              ),
            ],
            fontSize: 13,
          ),
          titleSmall: TextStyle(
            fontVariations: [
              FontVariation(
                CustomFontWeight.weight,
                CustomFontWeight.weight400,
              ),
            ],
            fontSize: 15,
            color: Color.fromARGB(204, 32, 32, 32),
          ),
          bodyLarge: TextStyle(
            fontVariations: [
              FontVariation(
                CustomFontWeight.weight,
                CustomFontWeight.weight400,
              ),
            ],
            fontSize: 13,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          bodyMedium: TextStyle(
            fontVariations: [
              FontVariation(
                CustomFontWeight.weight,
                CustomFontWeight.weight300,
              ),
            ],
            fontSize: 15,
          ),
        ),
        // scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            borderSide: BorderSide.none,
          ),
          fillColor: Color.fromARGB(255, 219, 224, 234),
          filled: true,
          prefixIconConstraints: BoxConstraints(minWidth: 24, maxHeight: 24),
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).hintColor),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
      ),
      routes: {
        '/': (context) => SliverOurTeamPage(),
        // '/': (context) => OurTeamPage(),
        '/trainer_page': (context) => TrainerPage(),
      },
    );
  }
}

class CustomFontWeight {
  static final weight = 'wght';
  static final weight550 = 550.0;
  static final weight400 = 400.0;
  static final weight300 = 300.0;
}

// акцентный текст Color.fromARGB(255, 30, 111, 254),--------------------------+
// бледно голубой для кнопки и инпута Color.fromARGB(255, 174, 199, 241),------+
// средний серый  Color.fromARGB(255, 93, 93, 93),-----------------------------+
// серый цвет Color.fromARGB(255, 134, 134, 134)------------------------------+-
// светлая тема текст Color.fromARGB(200, 26, 26, 26)--------------------------+
// цвет фона инпута Color.fromARGB(255, 219, 224, 234) в 1 месте----------------
// цвет текста маркдауна Color.fromARGB(204, 32, 32, 32)-----------------------+
// бэкграунд калор скафолда Color.fromARGB(255, 243, 243, 243)-----------------+
// цвет боди контейнера Color.fromARGB(120, 255, 255, 255) в 1месте цвет навигации
// цвет флексибл спейса аппбара Color.fromARGB(10, 143, 251, 255) настройка прозрачности
// scaffoldBackgroundColor: Color.fromARGB(255, 243, 243, 243)-----------------+
