import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'package:my_fitness_project/widgets/trainer_card.dart';

import 'favorite_trainer_text_block.dart';

class FavoriteTrainersSection extends ConsumerWidget {
  final String sectionTitle;

  const FavoriteTrainersSection({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteListId = ref.watch(favoriteTrainersArr);
    final trainerListAsync = ref.watch(originalTrainersArr);

    return trainerListAsync.when(
      loading: () => SliverToBoxAdapter(
        child: const Center(
          child: Column(
            children: [SizedBox(height: 50), CircularProgressIndicator()],
          ),
        ),
      ),
      error: (error, stack) => SliverToBoxAdapter(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                ' $error',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ),
      data: (trainers) {
        final favoriteList = trainers
            .where((trainer) => favoriteListId.contains(trainer.id))
            .toList();

        return SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          sliver: SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sectionTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 17),
                  ],
                ),
              ),
              if (favoriteListId.isEmpty)
                const SliverToBoxAdapter(child: FavoriteTrainerTextBlock())
              else
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => TrainerCard(
                      imagePath: favoriteList[index].imagePath,
                      trainerName: favoriteList[index].name,
                      trainerType: favoriteList[index].trainerType,
                      trainerId: favoriteList[index].id,
                    ),
                    childCount: favoriteList.length,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
