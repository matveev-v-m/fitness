import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';

import 'navigate_button.dart';

class NavigateBar extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;

  const NavigateBar({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainersAsync = ref.watch(originalTrainersArr);

    return trainersAsync.when(
      loading: () => const SizedBox(height: 28, child: SizedBox()),
      error: (error, stack) => SizedBox(
        height: 28,
        child: Center(
          child: Text(
            'Печально 😭',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ),
      data: (trainers) {
        final sectionTitleList = Set.from(
          trainers.map((trainer) => trainer.typeOfSpecialization.title),
        );

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
                    text:
                        item[0].toUpperCase() + item.substring(1).toLowerCase(),
                    targetKey: sectionKeys[item]!,
                  ),
                ),
              ),
            ],
          ),
        );
      }, // <-- Закрывающая скобка для data
    ); // <-- Закрывающая скобка для when
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:my_fitness_project/state.dart';
//
// import 'navigate_button.dart';
//
// class NavigateBar extends ConsumerWidget {
//   final Map<String, GlobalKey> sectionKeys;
//
//   const NavigateBar({super.key, required this.sectionKeys});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final trainers = ref.watch(trainersArr);
//     final sectionTitleList = Set.from(
//       trainers.map((trainer) => trainer.typeOfSpecialization),
//     );
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           ...sectionTitleList.map(
//             (item) => Padding(
//               padding: const EdgeInsets.only(right: 7),
//               child: NavigateButton(
//                 text: item[0].toUpperCase() + item.substring(1).toLowerCase(),
//                 targetKey: sectionKeys[item] ?? sectionKeys.values.first,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
