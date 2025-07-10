import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteTrainerTextBlock extends StatelessWidget {
  const FavoriteTrainerTextBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/heart_outlined.svg", fit: BoxFit.cover),
        const SizedBox(width: 11),
        Expanded(
          child: Text(
            "Выберите специалиста любимым на его странице, и он появится здесь",
            style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 134, 134, 134)),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
