import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';

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
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          spacing: 10,
          children: [
            Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Color.fromARGB(255, 30, 111, 254),
            ),
            Text(
              isFavorite ? "В любимых" : "В любимые",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 30, 111, 254),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
