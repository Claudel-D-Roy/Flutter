import 'package:hive/hive.dart';

part 'combatant.g.dart';

@HiveType(typeId: 1)
class Combatant {
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String imagePath;

  @HiveField(3)
  String sex;

  Combatant({
    required this.firstName,
    required this.lastName,
    required this.imagePath,
    required this.sex,
  });
}

