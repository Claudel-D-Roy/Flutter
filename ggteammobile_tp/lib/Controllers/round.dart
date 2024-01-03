import 'package:hive/hive.dart';

part 'round.g.dart';

@HiveType(typeId: 2)
class Round {
  @HiveField(0)
  int dominationCombatant1;
  @HiveField(1)
  int dominationCombatant2;

  @HiveField(2)
  int vulnerabiliteCombatant1;
  @HiveField(3)
  int vulnerabiliteCombatant2;

  @HiveField(4)
  int positionnementCombatant1;
  @HiveField(5)
  int positionnementCombatant2;

  @HiveField(6)
  int coupQualiteCombatant1;
  @HiveField(7)
  int coupQualiteCombatant2;

  @HiveField(8)
  int gestionEnergieCombatant1;
  @HiveField(9)
  int gestionEnergieCombatant2;

  @HiveField(10)
  int piedCombatant1;
  @HiveField(11)
  int piedCombatant2;

  @HiveField(12)
  int defenseCombatant1;
  @HiveField(13)
  int defenseCombatant2;

  @HiveField(14)
  int perceptionCombatant1;
  @HiveField(15)
  int perceptionCombatant2;

  @HiveField(16)
  int rythmeCombatant1;
  @HiveField(17)
  int rythmeCombatant2;

  @HiveField(18)
  int ringCombatant1;
  @HiveField(19)
  int ringCombatant2;

  @HiveField(20)
  String commentaire;

  Round({
    required this.dominationCombatant1,
    required this.dominationCombatant2,
    required this.vulnerabiliteCombatant1,
    required this.vulnerabiliteCombatant2,
    required this.positionnementCombatant1,
    required this.positionnementCombatant2,
    required this.coupQualiteCombatant1,
    required this.coupQualiteCombatant2,
    required this.gestionEnergieCombatant1,
    required this.gestionEnergieCombatant2,
    required this.piedCombatant1,
    required this.piedCombatant2,
    required this.defenseCombatant1,
    required this.defenseCombatant2,
    required this.perceptionCombatant1,
    required this.perceptionCombatant2,
    required this.rythmeCombatant1,
    required this.rythmeCombatant2,
    required this.ringCombatant1,
    required this.ringCombatant2,
    required this.commentaire,
  });
}



