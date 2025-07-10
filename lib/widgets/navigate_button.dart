import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  final String text;
  final GlobalKey targetKey;

  const NavigateButton({super.key, required this.text, required this.targetKey});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color.fromARGB(255, 174, 199, 241), width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(52)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        textStyle: const TextStyle(fontSize: 13),
        alignment: Alignment.center,
        foregroundColor: Colors.black,
      ),
      onPressed: () => _scrollToSection(context),
      child: Text(text),
    );
  }

  void _scrollToSection(BuildContext context) {
    if (targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.17,
      );
    }
  }
}
