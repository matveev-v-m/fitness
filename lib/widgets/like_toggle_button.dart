import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/generated/icons/custom_icons.dart';
import 'package:my_fitness_project/state.dart';

import '../generated/l10n.dart';

class LikeToggleButton extends ConsumerWidget {
  final int trainerId;

  const LikeToggleButton({super.key, required this.trainerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isFavorite = ref.watch(favoriteTrainersArr).contains(trainerId);
    return GestureDetector(
      onTap: () {
        final currentFavorites = ref.read(favoriteTrainersArr);

        final newFavorites = {...currentFavorites};

        if (isFavorite) {
          newFavorites.remove(trainerId);
        } else {
          newFavorites.add(trainerId);
        }

        ref.read(favoriteTrainersArr.notifier).state = newFavorites;
      },
      child: Row(
        spacing: 10,
        children: [
          Icon(
            isFavorite ? CustomIcons.heart : CustomIcons.heart_outline,
            size: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            isFavorite
                ? S.of(context).in_favorites
                : S.of(context).to_favorites,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
