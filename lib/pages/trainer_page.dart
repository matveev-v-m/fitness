import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'package:my_fitness_project/widgets/about_trainer.dart';
import 'package:my_fitness_project/widgets/about_trainer_list_item.dart';
import 'package:my_fitness_project/widgets/like_toggle_button.dart';

import '../generated/icons/custom_icons.dart';
import '../generated/l10n.dart';

class TrainerPage extends ConsumerWidget {
  const TrainerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainerId = ModalRoute.of(context)!.settings.arguments as int;
    final trainersAsync = ref.watch(originalTrainersArr);

    return trainersAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Scaffold(body: Center(child: Text('$error'))),
      data: (trainers) {
        final trainerItem = trainers.firstWhere((item) => item.id == trainerId);

        return Scaffold(
          body: ListView(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      trainerItem.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      CustomIcons.arrow_back,
                      size: 12,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AboutTrainer(
                      trainerName: trainerItem.name,
                      trainerType: trainerItem.trainerType,
                    ),
                    if (trainerItem.description != '') ...[
                      SizedBox(height: 18),
                      AboutTrainerListItems(
                        trainerDescription: trainerItem.description,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LikeToggleButton(trainerId: trainerId),
                Row(
                  children: [
                    Icon(
                      CustomIcons.share,
                      size: 17,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      S.of(context).share,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
