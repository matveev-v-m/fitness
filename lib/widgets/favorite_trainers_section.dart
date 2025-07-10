import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'package:my_fitness_project/widgets/favorite_trainer_text_block.dart';
import 'package:my_fitness_project/widgets/trainer_card.dart';

class FavoriteTrainersSection extends ConsumerWidget {
  final String sectionTitle;
  const FavoriteTrainersSection({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteListId = ref.watch(favoriteTrainersArr);
    final trainerList = ref.watch(originalTrainersArr);
    final favoriteList = trainerList.where((trainer) => favoriteListId.contains(trainer.id));
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sectionTitle, style: TextStyle(fontSize: 17)),
              const SizedBox(height: 17),
              favoriteListId.isEmpty
                  ? FavoriteTrainerTextBlock()
                  : SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          ...favoriteList.map(
                            (item) => TrainerCard(
                              imagePath: item.imagePath,
                              trainerName: item.name,
                              trainerType: item.trainerType,
                              trainerId: item.id,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
