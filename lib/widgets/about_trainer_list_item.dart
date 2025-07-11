import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

//реализация через markdown
class AboutTrainerListItems extends StatelessWidget {
  final String trainerDescription;
  const AboutTrainerListItems({super.key, required this.trainerDescription});

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: trainerDescription,
      styleSheet: MarkdownStyleSheet(
        blockSpacing: 10,
        p: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: const Color.fromARGB(204, 32, 32, 32),
          height: 1.5,
        ),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }
}

//реализация через виджеты
class ListItem extends StatelessWidget {
  final List<String> sportTypeList;
  const ListItem({super.key, required this.sportTypeList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...sportTypeList.map(
          (item) => Row(
            spacing: 10,
            children: [
              Icon(Icons.circle, size: 8, color: Color.fromARGB(204, 32, 32, 32)),
              Text(
                item,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(204, 32, 32, 32),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
