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

  factory Trainer.fromMap(Map<String, dynamic> map) {
    return Trainer(
      id: map['id'] as int,
      name: map['name'] as String,
      typeOfSpecialization: map['type_of_specialization'] as String,
      trainerType: map['trainer_type'] as String,
      description: map['description'] as String,
      imagePath: map['image_path'] as String,
    );
  }
}

final newTrainerArr = Provider<List<Trainer>>((ref) {
  return [
    Trainer(
      id: 1,
      name: 'Иванова Анна Сергеевна',
      typeOfSpecialization: 'БАССЕЙН',
      trainerType: 'Тренер по плаванию',
      description: 'плавание для начинающих, аквааэробика, спортивное плавание',
      imagePath: 'assets/images/trainer_image_id_1.jpg',
    ),
  ];
});

final originalTrainersArr = Provider<List<Trainer>>((ref) {
  final data = [
    // БАССЕЙН
    {
      'id': 1,
      'name': 'Иванова Анна Сергеевна',
      'type_of_specialization': 'БАССЕЙН',
      'trainer_type': 'Тренер по плаванию',
      'description':
          """### Приоритетные направления:\n - плавание для начинающих\n - аквааэробика\n - спортивное плавание""",
      'image_path': 'assets/images/trainer_image_id_1.jpg',
    },
    {
      'id': 2,
      'name': 'Петров Дмитрий Владимирович',
      'type_of_specialization': 'БАССЕЙН',
      'trainer_type': 'Тренер по плаванию',
      'description':
          '### Приоритетные направления:\n - подготовка к триатлону\n - техника плавания кролем',
      'image_path': 'assets/images/trainer_image_id_2.jpg',
    },
    {
      'id': 3,
      'name': 'Смирнова Екатерина Олеговна',
      'type_of_specialization': 'БАССЕЙН',
      'trainer_type': 'Тренер по плаванию',
      'description':
          '### Приоритетные направления:\n - оздоровительное плавание\n - плавание для беременных',
      'image_path': 'assets/images/trainer_image_id_3.jpg',
    },

    // ТРЕНАЖЁРНЫЙ ЗАЛ
    {
      'id': 4,
      'name': 'Максименко Павел Иванович',
      'type_of_specialization': 'ТРЕНАЖЁРНЫЙ ЗАЛ',
      'trainer_type': 'Фитнес тренер',
      'description':
          '### Приоритетные направления:\n - силовой прогресс - снижение веса\n - коррекция фигуры',
      'image_path': 'assets/images/trainer_image_id_4.jpg',
    },
    {
      'id': 5,
      'name': 'Козлова Марина Александровна',
      'type_of_specialization': 'ТРЕНАЖЁРНЫЙ ЗАЛ',
      'trainer_type': 'Фитнес тренер',
      'description':
          '### Приоритетные направления:\n - функциональный тренинг\n - кроссфит\n - пилатес',
      'image_path': 'assets/images/trainer_image_id_5.jpg',
    },
    {
      'id': 6,
      'name': 'Сидоров Артём Игоревич',
      'type_of_specialization': 'ТРЕНАЖЁРНЫЙ ЗАЛ',
      'trainer_type': 'Фитнес тренер',
      'description': '### Приоритетные направления:\n - бодибилдинг\n - пауэрлифтинг',
      'image_path': 'assets/images/trainer_image_id_6.jpg',
    },

    // ДЕТСКИЕ ТРЕНИРОВКИ
    {
      'id': 7,
      'name': 'Васильева Ольга Николаевна',
      'type_of_specialization': 'ДЕТСКИЕ ТРЕНИРОВКИ',
      'trainer_type': 'Детский тренер',
      'description': '### Приоритетные направления:\n - детская гимнастика\n - подвижные игры',
      'image_path': 'assets/images/trainer_image_id_7.jpg',
    },
    {
      'id': 8,
      'name': 'Николаев Сергей Петрович',
      'type_of_specialization': 'ДЕТСКИЕ ТРЕНИРОВКИ',
      'trainer_type': 'Детский тренер',
      'description':
          '### Приоритетные направления:\n - детский фитнес\n - подготовка к спортивным секциям',
      'image_path': 'assets/images/trainer_image_id_8.jpg',
    },
    {
      'id': 9,
      'name': 'Фёдорова Ирина Викторовна',
      'type_of_specialization': 'ДЕТСКИЕ ТРЕНИРОВКИ',
      'trainer_type': 'Детский тренер',
      'description': '### Приоритетные направления:\n - развивающая гимнастика\n - детская йога',
      'image_path': 'assets/images/trainer_image_id_9.jpg',
    },

    // ГРУППОВЫЕ ПРОГРАММЫ
    {
      'id': 10,
      'name': 'Алексеев Андрей Михайлович',
      'type_of_specialization': 'ГРУППОВЫЕ ПРОГРАММЫ',
      'trainer_type': 'Тренер групповых занятий',
      'description':
          '### Приоритетные направления:\n - круговые тренировки\n - TRX\n - интервальные тренировки',
      'image_path': 'assets/images/trainer_image_id_10.jpg',
    },
    {
      'id': 11,
      'name': 'Григорьева Татьяна Сергеевна',
      'type_of_specialization': 'ГРУППОВЫЕ ПРОГРАММЫ',
      'trainer_type': 'Тренер групповых занятий',
      'description':
          '### Приоритетные направления:\n - танцевальный фитнес\n - зумба\n - степ-аэробика',
      'image_path': 'assets/images/trainer_image_id_11.jpg',
    },
    {
      'id': 12,
      'name': 'Дмитриев Иван Алексеевич',
      'type_of_specialization': 'ГРУППОВЫЕ ПРОГРАММЫ',
      'trainer_type': 'Тренер групповых занятий',
      'description': '### Приоритетные направления:\n - функциональный тренинг\n - HIIT',
      'image_path': 'assets/images/trainer_image_id_12.jpg',
    },
  ];

  return data.map((map) => Trainer.fromMap(map)).toList();
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
