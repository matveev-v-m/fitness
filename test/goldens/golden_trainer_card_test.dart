import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_fitness_project/widgets/trainer_card.dart';

void main() {
  testWidgets('Golden trainer card renders correctly', (
    WidgetTester tester,
  ) async {
    // Рендерим виджет
    await tester.pumpWidget(
      ProviderScope(
        child: const MaterialApp(
          home: TrainerCard(
            trainerName: 'Иванова Анна Сергеевна',
            trainerId: 1,
            imagePath: 'assets/images/trainer_image_id_1.jpg',
            trainerType: 'Тренер по плаванию',
          ),
        ),
      ),
    );

    // Сравниваем с golden-файлом
    await expectLater(
      find.byType(TrainerCard),
      matchesGoldenFile('goldens/golden_trainer_card.png'),
    );
  });
}
