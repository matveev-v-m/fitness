import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_fitness_project/state.dart';
import 'package:my_fitness_project/widgets/about_trainer.dart';
import 'package:my_fitness_project/widgets/about_trainer_list_item.dart';
import 'package:my_fitness_project/widgets/like_toggle_button.dart';

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
                icon: SvgPicture.asset(
                  "assets/images/arrow_back.svg",
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(255, 255, 255, 255),
                    BlendMode.srcIn,
                  ),
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
              color: Color.fromARGB(255, 174, 199, 241),
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
              padding: const EdgeInsets.only(right: 33),
              child: Row(
                children: [
                  Icon(
                    Icons.share_outlined,
                    color: Color.fromARGB(255, 30, 111, 254),
                  ),
                  Text(
                    'Поделиться',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 30, 111, 254),
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
