import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_fitness_project/generated/icons/custom_icons.dart';
import 'package:my_fitness_project/widgets/trainers_section.dart';

import '../generated/l10n.dart';
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
            icon: Icon(CustomIcons.arrow_back, size: 12),
          ),
        ),
        centerTitle: true,
        title: Text(
          S.of(context).our_team,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: const Color.fromARGB(10, 143, 251, 255)),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(105),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      body: TrainersSection(
        sectionKeys: {
          "БАССЕЙН": poolKey,
          "ТРЕНАЖЁРНЫЙ ЗАЛ": gymKey,
          "ДЕТСКИЕ ТРЕНИРОВКИ": kidsKey,
          "ГРУППОВЫЕ ПРОГРАММЫ": groupKey,
        },
        scrollController: _scrollController,
      ),
    );
  }
}

// controller: _scrollController,
class SliverOurTeamPage extends StatelessWidget {
  SliverOurTeamPage({super.key});

  final GlobalKey poolKey = GlobalKey();
  final GlobalKey gymKey = GlobalKey();
  final GlobalKey kidsKey = GlobalKey();
  final GlobalKey groupKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            floating: true,
            snap: true,
            elevation: 0,
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
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
                icon: Icon(CustomIcons.arrow_back, size: 12),
              ),
            ),
            title: Text(
              S.of(context).our_team,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            // flexibleSpace: FlexibleSpaceBar(
            //   collapseMode: CollapseMode.pin,
            //   background: Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child: Align(
            //       alignment: Alignment.bottomLeft,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           const CustomInput(),
            //           const SizedBox(height: 15),
            //           NavigateBar(
            //             sectionKeys: {
            //               "БАССЕЙН": poolKey,
            //               "ТРЕНАЖЁРНЫЙ ЗАЛ": gymKey,
            //               "ДЕТСКИЕ ТРЕНИРОВКИ": kidsKey,
            //               "ГРУППОВЫЕ ПРОГРАММЫ": groupKey,
            //             },
            //           ),
            //           const SizedBox(height: 15),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(105),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 19, right: 19),
            sliver: SliverTrainersSection(
              sectionKeys: {
                "БАССЕЙН": poolKey,
                "ТРЕНАЖЁРНЫЙ ЗАЛ": gymKey,
                "ДЕТСКИЕ ТРЕНИРОВКИ": kidsKey,
                "ГРУППОВЫЕ ПРОГРАММЫ": groupKey,
              },
            ),
          ),
        ],
      ),
    );
  }
}
