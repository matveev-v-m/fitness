import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_fitness_project/widgets/favorite_trainers_section.dart';
import 'package:my_fitness_project/widgets/trainers_section.dart';
import '../widgets/custom_input.dart';
import '../widgets/navigate_bar.dart';

class OurTeamPage extends StatelessWidget {
  OurTeamPage({super.key});

  final GlobalKey poolKey = GlobalKey();
  final GlobalKey gymKey = GlobalKey();
  final GlobalKey kidsKey = GlobalKey();
  final GlobalKey groupKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => {
              _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              ),
            },
            icon: SvgPicture.asset(
              "assets/images/arrow_back.svg",
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Color.fromARGB(255, 0, 0, 0), BlendMode.srcIn),
            ),
          ),
        ),
        centerTitle: true,
        title: Text("НАША КОМАНДА"),
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: const Color.fromARGB(10, 143, 251, 255)),
          ),
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Container(
            color: const Color.fromARGB(120, 255, 255, 255),
            child: Column(
              children: [
                const SizedBox(height: 5),
                const CustomInput(),
                const SizedBox(height: 15),
                NavigateBar(
                  sectionKeys: {
                    "БАССЕЙН": poolKey,
                    "ТРЕНАЖЁРНЫЙ ЗАЛ": gymKey,
                    "ДЕТСКИЕ ТРЕНИРОВКИ": kidsKey,
                    "ГРУППОВЫЕ ПРОГРАММЫ": groupKey,
                  },
                ),
                const SizedBox(height: 21),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 21),
                FavoriteTrainersSection(sectionTitle: "ЛЮБИМЫЕ СПЕЦИАЛИСТЫ"),
                TrainersSection(
                  sectionKeys: {
                    "БАССЕЙН": poolKey,
                    "ТРЕНАЖЁРНЫЙ ЗАЛ": gymKey,
                    "ДЕТСКИЕ ТРЕНИРОВКИ": kidsKey,
                    "ГРУППОВЫЕ ПРОГРАММЫ": groupKey,
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
