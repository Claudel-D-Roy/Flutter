// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combatant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CombatantAdapter extends TypeAdapter<Combatant> {
  @override
  final int typeId = 1;

  @override
  Combatant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Combatant(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      imagePath: fields[2] as String,
      sex: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Combatant obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.sex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CombatantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
