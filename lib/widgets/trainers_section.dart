import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'package:my_fitness_project/widgets/trainers_section_item.dart';

class TrainersSection extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;
  const TrainersSection({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainers = ref.watch(trainersArr);
    final sectionTitleList = Set.from(trainers.map((trainer) => trainer.typeOfSpecialization));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...sectionTitleList.map(
          (trainer) => TrainersSectionItem(sectionTitle: trainer, key: sectionKeys[trainer]),
        ),
      ],
    );
  }
}
