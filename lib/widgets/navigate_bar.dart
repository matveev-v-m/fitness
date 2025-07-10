import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'navigate_button.dart';

class NavigateBar extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;
  const NavigateBar({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainers = ref.watch(trainersArr);
    final sectionTitleList = Set.from(trainers.map((trainer) => trainer.typeOfSpecialization));
    return SizedBox(
      height: 28,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        children: [
          ...sectionTitleList.map(
            (item) => Padding(
              padding: const EdgeInsets.only(right: 7),
              child: NavigateButton(
                text: item[0].toUpperCase() + item.substring(1).toLowerCase(),
                targetKey: sectionKeys[item]!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
