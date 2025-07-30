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
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          //todo переделать
          color: const Color.fromARGB(255, 219, 224, 234),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 2.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (value) {
              ref.read(searchTextProvider.notifier).state = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                CustomIcons.search,
                size: 17,
                color: Theme.of(context).colorScheme.primary,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 24,
                maxHeight: 24,
              ),
              hintText: S.of(context).search_trainer,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).hintColor,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
    );
  }
}
