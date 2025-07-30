import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'package:my_fitness_project/widgets/trainers_section_item.dart';

import 'favorite_trainers_section.dart';

class TrainersSection extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;

  const TrainersSection({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionTitleList = ref.watch(sectionTitleSet);
    return ListView.builder(
      shrinkWrap: true, //todo
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sectionTitleList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return FavoriteTrainersSection(sectionTitle: "ЛЮБИМЫЕ СПЕЦИАЛИСТЫ");
        }
        final trainer = sectionTitleList[index - 1];
        return TrainersSectionItem(
          sectionTitle: trainer,
          key: sectionKeys[trainer],
        );
      },
    );
  }
}

class SliverTrainersSection extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;

  const SliverTrainersSection({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionTitleList = ref.watch(sectionTitleSet);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return FavoriteTrainersSection(sectionTitle: "ЛЮБИМЫЕ СПЕЦИАЛИСТЫ");
        }
        final trainer = sectionTitleList[index - 1];
        return TrainersSectionItem(
          sectionTitle: trainer,
          key: sectionKeys[trainer],
        );
      }, childCount: sectionTitleList.length + 1),
    );
  }
}
