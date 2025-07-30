import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'package:my_fitness_project/widgets/trainer_card.dart';

class TrainersSectionItem extends ConsumerWidget {
  final String sectionTitle;

  const TrainersSectionItem({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionTrainersList = ref
        .watch(trainersArr)
        .where((item) => item.typeOfSpecialization == sectionTitle)
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          // width: 355,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectionTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 17),

              // SizedBox(
              //   height: 250,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: sectionTrainersList.length,
              //     itemBuilder: (context, index) {
              //       return TrainerCard(
              //         imagePath: sectionTrainersList[index].imagePath,
              //         trainerName: sectionTrainersList[index].name,
              //         trainerType: sectionTrainersList[index].trainerType,
              //         trainerId: sectionTrainersList[index].id,
              //       );
              //     },
              //   ),
              // ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  childAspectRatio: 0.6,

                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sectionTrainersList.length,
                itemBuilder: (context, index) {
                  return TrainerCard(
                    imagePath: sectionTrainersList[index].imagePath,
                    trainerName: sectionTrainersList[index].name,
                    trainerType: sectionTrainersList[index].trainerType,
                    trainerId: sectionTrainersList[index].id,
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
