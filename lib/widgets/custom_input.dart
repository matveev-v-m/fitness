import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';

import '../generated/icons/custom_icons.dart';
import '../generated/l10n.dart';

class CustomInput extends ConsumerWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 2,
            ),
          ),
        ),
        child: TextField(
          onChanged: (value) {
            ref.read(searchTextProvider.notifier).state = value;
          },
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Icon(
                CustomIcons.search,
                size: 17,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            hintText: S.of(context).search_trainer,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ),
    );
  }
}
