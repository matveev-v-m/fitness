import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_fitness_project/generated/l10n.dart';
import 'package:my_fitness_project/widgets/custom_input.dart';

void main() {
  testWidgets('Golden input renders correctly', (WidgetTester tester) async {
    // Рендерим виджет
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [const Locale('ru', 'RU'), const Locale('en', 'US')],
        locale: const Locale('ru', 'RU'),
        home: Scaffold(body: CustomInput()),
      ),
    );

    // Сравниваем с golden-файлом
    await expectLater(
      find.byType(CustomInput),
      matchesGoldenFile('goldens/golden_input.png'),
    );
  });
}
