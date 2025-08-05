import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'generated/protobuf/trainer.pbgrpc.dart';

class Trainer {
  final int id;
  final String name;
  final String typeOfSpecialization;
  final String trainerType;
  final String? description;
  final String imagePath;

  const Trainer({
    required this.id,
    required this.name,
    required this.typeOfSpecialization,
    required this.trainerType,
    this.description,
    this.imagePath = 'assets/images/trainer_image_default.jpg',
  });
}

enum Departments {
  pool('БАССЕЙН'),
  gym('ТРЕНАЖЁРНЫЙ ЗАЛ'),
  childrenTraining('ДЕТСКИЕ ТРЕНИРОВКИ'),
  groupPrograms('ГРУППОВЫЕ ПРОГРАММЫ');

  final String value;

  const Departments(this.value);
}

// final originalTrainersArr = FutureProvider<List<TrainerProto>>((ref) async {
//   final channel = GrpcOrGrpcWebClientChannel.grpc(
//     'localhost',
//     port: 8085,
//     options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
//   );
//
//   final client = TrainerServiceClient(channel);
//   final res = StreamController<List<TrainerProto>>();
//
//   try {
//     final data = await client.getTrainers(Empty());
//     return data.items;
//   } catch (e) {
//     throw Exception('Сервер упал 😁');
//   }
// });

// final originalTrainersArr = StreamProvider.autoDispose<List<TrainerProto>>((
//   ref,
// ) {
//   final channel = GrpcOrGrpcWebClientChannel.grpc(
//     'localhost',
//     port: 8085,
//     options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
//   );
//
//   final client = TrainerServiceClient(channel);
//   final res = StreamController<List<TrainerProto>>();
//
//   () async {
//     while (!res.isClosed) {
//       try {
//         await for (var response in client.streamTrainers(Empty())) {
//           if (!res.isClosed) {
//             res.add(response.items);
//           }
//         }
//       } catch (e, s) {
//         if (!res.isClosed) {
//           res.addError(e, s);
//         }
//       }
//       if (!res.isClosed) {
//         await Future.delayed(Duration(seconds: 1));
//       }
//     }
//   }();
//
//   ref.onDispose(() {
//     res.close();
//     channel.terminate();
//   });
//   return res.stream;
// });

//
final originalTrainersArr = FutureProvider<List<TrainerProto>>((ref) async {
  try {
    final protobufResponse = await http.get(
      Uri.parse('http://localhost:8085/data'),
    );
    final dataResponse = DataResponse.fromBuffer(protobufResponse.bodyBytes);
    return dataResponse.items;
  } catch (e) {
    throw Exception('Сервер упал 😁');
  }
});

// final originalTrainersArr = Provider<List<TrainerProto>>((ref) {
//   return [
//     TrainerProto()
//       ..id = 1
//       ..name = 'Иванова Анна Сергеевна'
//       ..typeOfSpecialization = (Department()
//         ..id = '1'
//         ..title = Departments.pool.value)
//       ..trainerType = 'Тренер по плаванию'
//       ..description =
//           """###  Направления:\n - плавание для начинающих\n - аквааэробика\n - спортивное плавание"""
//       ..imagePath = 'assets/images/trainer_image_id_1.jpg',
//
//     TrainerProto()
//       ..id = 2
//       ..name = 'Петров Дмитрий Владимирович'
//       ..typeOfSpecialization = (Department()
//         ..id = '1'
//         ..title = Departments.pool.value)
//       ..trainerType = 'Тренер по плаванию'
//       ..description =
//           """###  Направления:\n - подготовка к триатлону\n - техника плавания кролем"""
//       ..imagePath = 'assets/images/trainer_image_id_2.jpg',
//
//     TrainerProto()
//       ..id = 3
//       ..name = 'Смирнова Екатерина Олеговна'
//       ..typeOfSpecialization = (Department()
//         ..id = '1'
//         ..title = Departments.pool.value)
//       ..trainerType = 'Тренер по плаванию'
//       ..description =
//           """###  Направления:\n - оздоровительное плавание\n - плавание для беременных"""
//       ..imagePath = 'assets/images/trainer_image_id_3.jpg',
//
//     TrainerProto()
//       ..id = 4
//       ..name = 'Максименко Павел Иванович'
//       ..typeOfSpecialization = (Department()
//         ..id = '2'
//         ..title = Departments.gym.value)
//       ..trainerType = 'Фитнес тренер'
//       ..description =
//           """###  Направления:\n - силовой прогресс - снижение веса\n - коррекция фигуры"""
//       ..imagePath = 'assets/images/trainer_image_id_4.jpg',
//
//     TrainerProto()
//       ..id = 5
//       ..name = 'Козлова Марина Александровна'
//       ..typeOfSpecialization = (Department()
//         ..id = '2'
//         ..title = Departments.gym.value)
//       ..trainerType = 'Фитнес тренер'
//       ..description =
//           """###  Направления:\n - функциональный тренинг\n - кроссфит\n - пилатес"""
//       ..imagePath = 'assets/images/trainer_image_id_5.jpg',
//
//     TrainerProto()
//       ..id = 6
//       ..name = 'Сидоров Артём Игоревич'
//       ..typeOfSpecialization = (Department()
//         ..id = '2'
//         ..title = Departments.gym.value)
//       ..trainerType = 'Фитнес тренер'
//       ..description = """###  Направления:\n - бодибилдинг\n - пауэрлифтинг"""
//       ..imagePath = 'assets/images/trainer_image_id_6.jpg',
//
//     TrainerProto()
//       ..id = 7
//       ..name = 'Васильева Ольга Николаевна'
//       ..typeOfSpecialization = (Department()
//         ..id = '3'
//         ..title = Departments.childrenTraining.value)
//       ..trainerType = 'Детский тренер'
//       ..description =
//           """###  Направления:\n - детская гимнастика\n - подвижные игры"""
//       ..imagePath = 'assets/images/trainer_image_id_7.jpg',
//
//     TrainerProto()
//       ..id = 8
//       ..name = 'Николаев Сергей Петрович'
//       ..typeOfSpecialization = (Department()
//         ..id = '3'
//         ..title = Departments.childrenTraining.value)
//       ..trainerType = 'Детский тренер'
//       ..description =
//           """###  Направления:\n - детский фитнес\n - подготовка к спортивным секциям"""
//       ..imagePath = 'assets/images/trainer_image_id_8.jpg',
//
//     TrainerProto()
//       ..id = 9
//       ..name = 'Фёдорова Ирина Викторовна'
//       ..typeOfSpecialization = (Department()
//         ..id = '3'
//         ..title = Departments.childrenTraining.value)
//       ..trainerType = 'Детский тренер'
//       ..description =
//           """###  Направления:\n - развивающая гимнастика\n - детская йога"""
//       ..imagePath = 'assets/images/trainer_image_id_9.jpg',
//
//     TrainerProto()
//       ..id = 10
//       ..name = 'Алексеев Андрей Михайлович'
//       ..typeOfSpecialization = (Department()
//         ..id = '4'
//         ..title = Departments.groupPrograms.value)
//       ..trainerType = 'Тренер групповых занятий'
//       ..description =
//           """###  Направления:\n - круговые тренировки\n - TRX\n - интервальные тренировки"""
//       ..imagePath = 'assets/images/trainer_image_id_10.jpg',
//
//     TrainerProto()
//       ..id = 11
//       ..name = 'Григорьева Татьяна Сергеевна'
//       ..typeOfSpecialization = (Department()
//         ..id = '4'
//         ..title = Departments.groupPrograms.value)
//       ..trainerType = 'Тренер групповых занятий'
//       ..description =
//           """###  Направления:\n - танцевальный фитнес\n - зумба\n - степ-аэробика"""
//       ..imagePath = 'assets/images/trainer_image_id_11.jpg',
//
//     TrainerProto()
//       ..id = 12
//       ..name = 'Дмитриев Иван Алексеевич'
//       ..typeOfSpecialization = (Department()
//         ..id = '4'
//         ..title = Departments.groupPrograms.value)
//       ..trainerType = 'Тренер групповых занятий'
//       ..description =
//           """###  Направления:\n - функциональный тренинг\n - HIIT"""
//       ..imagePath = 'assets/images/trainer_image_id_12.jpg',
//   ];
// });

// final originalTrainersArr = Provider<List<Trainer>>((ref) {
//   return [
//     Trainer(
//       id: 1,
//       name: 'Иванова Анна Сергеевна',
//       typeOfSpecialization: Department.pool.value,
//       trainerType: 'Тренер по плаванию',
//       description:
//           """###  Направления:\n - плавание для начинающих\n - аквааэробика\n - спортивное плавание""",
//       imagePath: 'assets/images/trainer_image_id_1.jpg',
//     ),
//     Trainer(
//       id: 2,
//       name: 'Петров Дмитрий Владимирович',
//       typeOfSpecialization: Department.pool.value,
//       trainerType: 'Тренер по плаванию',
//       description:
//           """###  Направления:\n - подготовка к триатлону\n - техника плавания кролем""",
//       imagePath: 'assets/images/trainer_image_id_2.jpg',
//     ),
//     Trainer(
//       id: 3,
//       name: 'Смирнова Екатерина Олеговна',
//       typeOfSpecialization: Department.pool.value,
//       trainerType: 'Тренер по плаванию',
//       description:
//           """###  Направления:\n - оздоровительное плавание\n - плавание для беременных""",
//       imagePath: 'assets/images/trainer_image_id_3.jpg',
//     ),
//     Trainer(
//       id: 4,
//       name: 'Максименко Павел Иванович',
//       typeOfSpecialization: Department.gym.value,
//       trainerType: 'Фитнес тренер',
//       description:
//           """###  Направления:\n - силовой прогресс - снижение веса\n - коррекция фигуры""",
//       imagePath: 'assets/images/trainer_image_id_4.jpg',
//     ),
//     Trainer(
//       id: 5,
//       name: 'Козлова Марина Александровна',
//       typeOfSpecialization: Department.gym.value,
//       trainerType: 'Фитнес тренер',
//       description:
//           """###  Направления:\n - функциональный тренинг\n - кроссфит\n - пилатес""",
//       imagePath: 'assets/images/trainer_image_id_5.jpg',
//     ),
//     Trainer(
//       id: 6,
//       name: 'Сидоров Артём Игоревич',
//       typeOfSpecialization: Department.gym.value,
//       trainerType: 'Фитнес тренер',
//       description: """###  Направления:\n - бодибилдинг\n - пауэрлифтинг""",
//       imagePath: 'assets/images/trainer_image_id_6.jpg',
//     ),
//     Trainer(
//       id: 7,
//       name: 'Васильева Ольга Николаевна',
//       typeOfSpecialization: Department.childrenTraining.value,
//       trainerType: 'Детский тренер',
//       description:
//           """###  Направления:\n - детская гимнастика\n - подвижные игры""",
//       imagePath: 'assets/images/trainer_image_id_7.jpg',
//     ),
//     Trainer(
//       id: 8,
//       name: 'Николаев Сергей Петрович',
//       typeOfSpecialization: Department.childrenTraining.value,
//       trainerType: 'Детский тренер',
//       description:
//           """###  Направления:\n - детский фитнес\n - подготовка к спортивным секциям""",
//       imagePath: 'assets/images/trainer_image_id_8.jpg',
//     ),
//     Trainer(
//       id: 9,
//       name: 'Фёдорова Ирина Викторовна',
//       typeOfSpecialization: Department.childrenTraining.value,
//       trainerType: 'Детский тренер',
//       description:
//           """###  Направления:\n - развивающая гимнастика\n - детская йога""",
//       imagePath: 'assets/images/trainer_image_id_9.jpg',
//     ),
//     Trainer(
//       id: 10,
//       name: 'Алексеев Андрей Михайлович',
//       typeOfSpecialization: Department.groupPrograms.value,
//       trainerType: 'Тренер групповых занятий',
//       description:
//           """###  Направления:\n - круговые тренировки\n - TRX\n - интервальные тренировки""",
//       imagePath: 'assets/images/trainer_image_id_10.jpg',
//     ),
//     Trainer(
//       id: 11,
//       name: 'Григорьева Татьяна Сергеевна',
//       typeOfSpecialization: Department.groupPrograms.value,
//       trainerType: 'Тренер групповых занятий',
//       description:
//           """###  Направления:\n - танцевальный фитнес\n - зумба\n - степ-аэробика""",
//       imagePath: 'assets/images/trainer_image_id_11.jpg',
//     ),
//     Trainer(
//       id: 12,
//       name: 'Дмитриев Иван Алексеевич',
//       typeOfSpecialization: Department.groupPrograms.value,
//       trainerType: 'Тренер групповых занятий',
//       description: """###  Направления:\n - функциональный тренинг\n - HIIT""",
//       imagePath: 'assets/images/trainer_image_id_12.jpg',
//     ),
//   ];
// });

final searchTextProvider = StateProvider<String>((ref) => '');

// final trainersArr = Provider<List<TrainerProto>>((ref) {
//   final searchText = ref.watch(searchTextProvider);
//   final originalTrainers = ref.watch(originalTrainersArr);
//
//   if (searchText.isEmpty) {
//     return originalTrainers;
//   }
//
//   return originalTrainers.where((trainer) {
//     return trainer.name.toLowerCase().contains(searchText.toLowerCase());
//   }).toList();
// });

final trainersArr = Provider<AsyncValue<List<TrainerProto>>>((ref) {
  final searchText = ref.watch(searchTextProvider);
  final originalTrainersAsync = ref.watch(originalTrainersArr);

  return originalTrainersAsync.when(
    loading: () => const AsyncValue.loading(),
    error: (error, stack) => AsyncValue.error(error, stack),
    data: (originalTrainers) {
      if (searchText.isEmpty) {
        return AsyncValue.data(originalTrainers);
      }

      final filteredTrainers = originalTrainers.where((trainer) {
        return trainer.name.toLowerCase().contains(searchText.toLowerCase());
      }).toList();

      return AsyncValue.data(filteredTrainers);
    },
  );
});

final favoriteTrainersArr = StateProvider<Set<int>>((ref) => <int>{});

// final sectionTitleSet = Provider<List<String>>((ref) {
//   final trainers = ref.watch(trainersArr);
//
//   return Set<String>.from(
//     trainers.map((trainer) => trainer.typeOfSpecialization.title),
//   ).toList();
// });

final sectionTitleSet = Provider<List<String>>((ref) {
  final trainersAsync = ref.watch(trainersArr);

  if (trainersAsync.isLoading) return [];

  if (trainersAsync.hasError) return [];

  final trainers = trainersAsync.value ?? [];

  return Set<String>.from(
    trainers.map((trainer) => trainer.typeOfSpecialization.title),
  ).toList();
});
