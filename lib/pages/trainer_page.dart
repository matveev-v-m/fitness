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
    final trainerId = ModalRoute.of(context)!.settings.arguments;
    final trainerItem = ref
        .watch(originalTrainersArr)
        .firstWhere((item) => item.id == trainerId);
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
                onPressed: () => {Navigator.pop(context)},
                icon: Icon(
                  CustomIcons.arrow_back,
                  size: 12,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutTrainer(
                  trainerName: trainerItem.name,
                  trainerType: trainerItem.trainerType,
                ),
                if (trainerItem.description != '' &&
                    trainerItem.description != null) ...[
                  SizedBox(height: 18),
                  AboutTrainerListItems(
                    trainerDescription: trainerItem.description!,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 33),
              child: LikeToggleButton(trainerId: trainerId as int),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 33), //todo доелать
              child: Row(
                children: [
                  Icon(
                    CustomIcons.share,
                    size: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: 5),
                  Text(
                    S.of(context).share,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
