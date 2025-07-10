import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/trainer_page', arguments: trainerId);
            },
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                        child: Image.asset(imagePath, height: 142, width: 150, fit: BoxFit.cover),
                      ),
                      if (isFavorite)
                        Positioned(
                          right: -7,
                          bottom: -3,
                          child: SvgPicture.asset("assets/images/like_icon.svg"),
                        ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    trainerName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(
                    trainerType,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 93, 93, 93),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 25),
      ],
    );
  }
}
