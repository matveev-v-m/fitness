import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'package:my_fitness_project/widgets/trainers_section_item.dart';

import 'favorite_trainers_section.dart';

class TrainersSection extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;
  final ScrollController scrollController;

  const TrainersSection({
    super.key,
    required this.sectionKeys,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionTitleList = ref.watch(sectionTitleSet);
    return ListView.builder(
      controller: scrollController,
      itemCount: sectionTitleList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(left: 19, right: 19),
            child: FavoriteTrainersSection(sectionTitle: "ЛЮБИМЫЕ СПЕЦИАЛИСТЫ"),
          );
        }
        final trainer = sectionTitleList[index - 1];
        return Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: TrainersSectionItem(
            sectionTitle: trainer,
            key: sectionKeys[trainer],
          ),
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
        final trainer = sectionTitleList[index];
        return TrainersSectionItem(
          sectionTitle: trainer,
          key: sectionKeys[trainer],
        );
      }, childCount: sectionTitleList.length),
    );
  }
}
