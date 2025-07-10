import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fitness_project/state.dart';

class CustomInput extends ConsumerWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 224, 234),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          border: const Border(
            bottom: BorderSide(color: Color.fromARGB(255, 174, 199, 241), width: 2.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (value) {
              ref.read(searchTextProvider.notifier).state = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, size: 24, color: Color.fromARGB(255, 30, 111, 254)),
              prefixIconConstraints: BoxConstraints(minWidth: 24, maxHeight: 24),
              hintText: "Поиск тренера",
              hintStyle: TextStyle(fontSize: 15),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
    );
  }
}
