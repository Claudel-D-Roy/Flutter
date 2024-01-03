// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 0;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      id: fields[0] as int,
      name: fields[1] as String,
      date: fields[2] as String,
      selectedWeight: fields[3] as String,
      selectedPhase: fields[4] as String,
      adversaire1: fields[5] as Combatant,
      adversaire2: fields[6] as Combatant,
      round1: fields[7] as Round,
      round2: fields[8] as Round,
      round3: fields[9] as Round,
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.selectedWeight)
      ..writeByte(4)
      ..write(obj.selectedPhase)
      ..writeByte(5)
      ..write(obj.adversaire1)
      ..writeByte(6)
      ..write(obj.adversaire2)
      ..writeByte(7)
      ..write(obj.round1)
      ..writeByte(8)
      ..write(obj.round2)
      ..writeByte(9)
      ..write(obj.round3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
