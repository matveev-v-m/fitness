import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/generated/icons/custom_icons.dart';
import 'package:my_fitness_project/state.dart';

class TrainerCard extends ConsumerWidget {
  final String trainerName;
  final int trainerId;
  final String imagePath;
  final String trainerType;

  const TrainerCard({
    super.key,
    required this.trainerName,
    required this.trainerId,
    required this.imagePath,
    required this.trainerType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteTrainersArr).contains(trainerId);
    return Column(
      children: [
        SizedBox(
          // width: 150,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/trainer_page',
                arguments: trainerId,
              );
            },
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          imagePath,
                          // height: 142,
                          // width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (isFavorite)
                        Positioned(
                          right: -7,
                          bottom: -3,
                          child: Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(13),
                              ),
                            ),
                            child: Icon(
                              CustomIcons.heart_favorite,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    trainerName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 4),
                  Text(
                    trainerType,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  // SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
        // SizedBox(width: 25),
      ],
    );
  }
}
