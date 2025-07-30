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
        h3: Theme.of(context).textTheme.titleSmall,
        p: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Color.fromARGB(204, 32, 32, 32),
        ),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }
}
