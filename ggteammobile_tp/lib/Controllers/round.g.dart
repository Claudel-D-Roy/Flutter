// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoundAdapter extends TypeAdapter<Round> {
  @override
  final int typeId = 2;

  @override
  Round read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Round(
      dominationCombatant1: fields[0] as int,
      dominationCombatant2: fields[1] as int,
      vulnerabiliteCombatant1: fields[2] as int,
      vulnerabiliteCombatant2: fields[3] as int,
      positionnementCombatant1: fields[4] as int,
      positionnementCombatant2: fields[5] as int,
      coupQualiteCombatant1: fields[6] as int,
      coupQualiteCombatant2: fields[7] as int,
      gestionEnergieCombatant1: fields[8] as int,
      gestionEnergieCombatant2: fields[9] as int,
      piedCombatant1: fields[10] as int,
      piedCombatant2: fields[11] as int,
      defenseCombatant1: fields[12] as int,
      defenseCombatant2: fields[13] as int,
      perceptionCombatant1: fields[14] as int,
      perceptionCombatant2: fields[15] as int,
      rythmeCombatant1: fields[16] as int,
      rythmeCombatant2: fields[17] as int,
      ringCombatant1: fields[18] as int,
      ringCombatant2: fields[19] as int,
      commentaire: fields[20] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Round obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.dominationCombatant1)
      ..writeByte(1)
      ..write(obj.dominationCombatant2)
      ..writeByte(2)
      ..write(obj.vulnerabiliteCombatant1)
      ..writeByte(3)
      ..write(obj.vulnerabiliteCombatant2)
      ..writeByte(4)
      ..write(obj.positionnementCombatant1)
      ..writeByte(5)
      ..write(obj.positionnementCombatant2)
      ..writeByte(6)
      ..write(obj.coupQualiteCombatant1)
      ..writeByte(7)
      ..write(obj.coupQualiteCombatant2)
      ..writeByte(8)
      ..write(obj.gestionEnergieCombatant1)
      ..writeByte(9)
      ..write(obj.gestionEnergieCombatant2)
      ..writeByte(10)
      ..write(obj.piedCombatant1)
      ..writeByte(11)
      ..write(obj.piedCombatant2)
      ..writeByte(12)
      ..write(obj.defenseCombatant1)
      ..writeByte(13)
      ..write(obj.defenseCombatant2)
      ..writeByte(14)
      ..write(obj.perceptionCombatant1)
      ..writeByte(15)
      ..write(obj.perceptionCombatant2)
      ..writeByte(16)
      ..write(obj.rythmeCombatant1)
      ..writeByte(17)
      ..write(obj.rythmeCombatant2)
      ..writeByte(18)
      ..write(obj.ringCombatant1)
      ..writeByte(19)
      ..write(obj.ringCombatant2)
      ..writeByte(20)
      ..write(obj.commentaire);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
