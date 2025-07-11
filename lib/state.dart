import 'package:flutter_riverpod/flutter_riverpod.dart';

class Trainer {
  final int id;
  final String name;
  final String typeOfSpecialization;
  final String trainerType;
  final String description;
  final String imagePath;

  const Trainer({
    required this.id,
    required this.name,
    required this.typeOfSpecialization,
    required this.trainerType,
    required this.description,
    required this.imagePath,
  });
}

final originalTrainersArr = Provider<List<Trainer>>((ref) {
  return [
    Trainer(
      id: 1,
      name: 'Иванова Анна Сергеевна',
      typeOfSpecialization: 'БАССЕЙН',
      trainerType: 'Тренер по плаванию',
      description: """### Приоритетные направления:\n - плавание для начинающих\n - аквааэробика\n - спортивное плавание""",
      imagePath: 'assets/images/trainer_image_id_1.jpg',
    ),
    Trainer(
      id: 2,
      name: 'Петров Дмитрий Владимирович',
      typeOfSpecialization: 'БАССЕЙН',
      trainerType: 'Тренер по плаванию',
      description: """### Приоритетные направления:\n - подготовка к триатлону\n - техника плавания кролем""",
      imagePath: 'assets/images/trainer_image_id_2.jpg',
    ),
    Trainer(
      id: 3,
      name: 'Смирнова Екатерина Олеговна',
      typeOfSpecialization: 'БАССЕЙН',
      trainerType: 'Тренер по плаванию',
      description: """### Приоритетные направления:\n - оздоровительное плавание\n - плавание для беременных""",
      imagePath: 'assets/images/trainer_image_id_3.jpg',
    ),
    Trainer(
      id: 4,
      name: 'Максименко Павел Иванович',
      typeOfSpecialization: 'ТРЕНАЖЁРНЫЙ ЗАЛ',
      trainerType: 'Фитнес тренер',
      description: """### Приоритетные направления:\n - силовой прогресс - снижение веса\n - коррекция фигуры""",
      imagePath: 'assets/images/trainer_image_id_4.jpg',
    ),
    Trainer(
      id: 5,
      name: 'Козлова Марина Александровна',
      typeOfSpecialization: 'ТРЕНАЖЁРНЫЙ ЗАЛ',
      trainerType: 'Фитнес тренер',
      description: """### Приоритетные направления:\n - функциональный тренинг\n - кроссфит\n - пилатес""",
      imagePath: 'assets/images/trainer_image_id_5.jpg',
    ),
    Trainer(
      id: 6,
      name: 'Сидоров Артём Игоревич',
      typeOfSpecialization: 'ТРЕНАЖЁРНЫЙ ЗАЛ',
      trainerType: 'Фитнес тренер',
      description: """### Приоритетные направления:\n - бодибилдинг\n - пауэрлифтинг""",
      imagePath: 'assets/images/trainer_image_id_6.jpg',
    ),
    Trainer(
      id: 7,
      name: 'Васильева Ольга Николаевна',
      typeOfSpecialization: 'ДЕТСКИЕ ТРЕНИРОВКИ',
      trainerType: 'Детский тренер',
      description: """### Приоритетные направления:\n - детская гимнастика\n - подвижные игры""",
      imagePath: 'assets/images/trainer_image_id_7.jpg',
    ),
    Trainer(
      id: 8,
      name: 'Николаев Сергей Петрович',
      typeOfSpecialization: 'ДЕТСКИЕ ТРЕНИРОВКИ',
      trainerType: 'Детский тренер',
      description: """### Приоритетные направления:\n - детский фитнес\n - подготовка к спортивным секциям""",
      imagePath: 'assets/images/trainer_image_id_8.jpg',
    ),
    Trainer(
      id: 9,
      name: 'Фёдорова Ирина Викторовна',
      typeOfSpecialization: 'ДЕТСКИЕ ТРЕНИРОВКИ',
      trainerType: 'Детский тренер',
      description: """### Приоритетные направления:\n - развивающая гимнастика\n - детская йога""",
      imagePath: 'assets/images/trainer_image_id_9.jpg',
    ),
    Trainer(
      id: 10,
      name: 'Алексеев Андрей Михайлович',
      typeOfSpecialization: 'ГРУППОВЫЕ ПРОГРАММЫ',
      trainerType: 'Тренер групповых занятий',
      description: """### Приоритетные направления:\n - круговые тренировки\n - TRX\n - интервальные тренировки""",
      imagePath: 'assets/images/trainer_image_id_10.jpg',
    ),
    Trainer(
      id: 11,
      name: 'Григорьева Татьяна Сергеевна',
      typeOfSpecialization: 'ГРУППОВЫЕ ПРОГРАММЫ',
      trainerType: 'Тренер групповых занятий',
      description: """### Приоритетные направления:\n - танцевальный фитнес\n - зумба\n - степ-аэробика""",
      imagePath: 'assets/images/trainer_image_id_11.jpg',
    ),
    Trainer(
      id: 12,
      name: 'Дмитриев Иван Алексеевич',
      typeOfSpecialization: 'ГРУППОВЫЕ ПРОГРАММЫ',
      trainerType: 'Тренер групповых занятий',
      description: """### Приоритетные направления:\n - функциональный тренинг\n - HIIT""",
      imagePath: 'assets/images/trainer_image_id_12.jpg',
    ),
  ];
});

final searchTextProvider = StateProvider<String>((ref) => '');

final trainersArr = Provider<List<Trainer>>((ref) {
  final searchText = ref.watch(searchTextProvider);
  final originalTrainers = ref.watch(originalTrainersArr);

  if (searchText.isEmpty) {
    return originalTrainers;
  }

  return originalTrainers.where((trainer) {
    return trainer.name.toLowerCase().contains(searchText.toLowerCase());
  }).toList();
});

final favoriteTrainersArr = StateProvider<Set<int>>((ref) => <int>{});
