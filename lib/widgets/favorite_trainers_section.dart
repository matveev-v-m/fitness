import 'package:flutter/material.dart';
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
    final favoriteList = trainerList
        .where((trainer) => favoriteListId.contains(trainer.id))
        .toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(sectionTitle, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 17),
        favoriteListId.isEmpty
            ? FavoriteTrainerTextBlock()
            : SizedBox(
                // height: 250,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    childAspectRatio: 0.6,

                    crossAxisSpacing: 15,

                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    return TrainerCard(
                      imagePath: favoriteList[index].imagePath,
                      trainerName: favoriteList[index].name,
                      trainerType: favoriteList[index].trainerType,
                      trainerId: favoriteList[index].id,
                    );
                  },
                ),
                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: favoriteList.length,
                //   itemBuilder: (context, index) {
                //     return TrainerCard(
                //       imagePath: favoriteList[index].imagePath,
                //       trainerName: favoriteList[index].name,
                //       trainerType: favoriteList[index].trainerType,
                //       trainerId: favoriteList[index].id,
                //     );
                //   },
                // ),
              ),
        SizedBox(height: 30),
      ],
    );
  }
}
