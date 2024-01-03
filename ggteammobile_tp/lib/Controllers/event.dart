import 'package:hive/hive.dart';
import 'package:ggteammobile_tp/Controllers/combatant.dart';
import 'package:ggteammobile_tp/Controllers/round.dart';
import 'package:flutter_guid/flutter_guid.dart';

part 'event.g.dart';

@HiveType(typeId: 0)
class Event {
  @HiveField(0)
  int id;
  
  @HiveField(1)
  String name;

  @HiveField(2)
  String date;

  @HiveField(3)
  String selectedWeight;

  @HiveField(4)
  String selectedPhase;

  @HiveField(5)
  Combatant adversaire1;

  @HiveField(6)
  Combatant adversaire2;

  @HiveField(7)
  Round round1;

  @HiveField(8)
  Round round2;

  @HiveField(9)
  Round round3;

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.selectedWeight,
    required this.selectedPhase,
    required this.adversaire1,
    required this.adversaire2,
    required this.round1,
    required this.round2,
    required this.round3,
  });
}

