import 'package:flutter/material.dart';
import 'package:my_fitness_project/generated/icons/custom_icons.dart';

import '../generated/l10n.dart';

class FavoriteTrainerTextBlock extends StatelessWidget {
  const FavoriteTrainerTextBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          CustomIcons.heart_outline,
          color: Theme.of(context).iconTheme.color,
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Text(
            S.of(context).favorite_trainer_text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
