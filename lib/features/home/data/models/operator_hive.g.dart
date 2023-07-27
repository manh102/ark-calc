// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OperatorHiveAdapter extends TypeAdapter<OperatorHive> {
  @override
  final int typeId = 1;

  @override
  OperatorHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OperatorHive(
      id: fields[0] == null ? 0 : fields[0] as int,
      name: fields[1] == null ? '' : fields[1] as String,
      starter: fields[2] == null ? false : fields[2] as bool,
      seniorOperator: fields[3] == null ? false : fields[3] as bool,
      topOperator: fields[4] == null ? false : fields[4] as bool,
      melee: fields[5] == null ? false : fields[5] as bool,
      ranged: fields[6] == null ? false : fields[6] as bool,
      guard: fields[7] == null ? false : fields[7] as bool,
      medic: fields[8] == null ? false : fields[8] as bool,
      vanguard: fields[9] == null ? false : fields[9] as bool,
      caster: fields[10] == null ? false : fields[10] as bool,
      sniper: fields[11] == null ? false : fields[11] as bool,
      defender: fields[12] == null ? false : fields[12] as bool,
      supporter: fields[13] == null ? false : fields[13] as bool,
      specialist: fields[14] == null ? false : fields[14] as bool,
      healing: fields[15] == null ? false : fields[15] as bool,
      support: fields[16] == null ? false : fields[16] as bool,
      dPS: fields[17] == null ? false : fields[17] as bool,
      aOE: fields[18] == null ? false : fields[18] as bool,
      slow: fields[19] == null ? false : fields[19] as bool,
      survival: fields[20] == null ? false : fields[20] as bool,
      defense: fields[21] == null ? false : fields[21] as bool,
      debuff: fields[22] == null ? false : fields[22] as bool,
      shift: fields[23] == null ? false : fields[23] as bool,
      crowdControl: fields[24] == null ? false : fields[24] as bool,
      nuker: fields[25] == null ? false : fields[25] as bool,
      summon: fields[26] == null ? false : fields[26] as bool,
      fastRedeploy: fields[27] == null ? false : fields[27] as bool,
      dPRecovery: fields[28] == null ? false : fields[28] as bool,
      robot: fields[29] == null ? false : fields[29] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OperatorHive obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.starter)
      ..writeByte(3)
      ..write(obj.seniorOperator)
      ..writeByte(4)
      ..write(obj.topOperator)
      ..writeByte(5)
      ..write(obj.melee)
      ..writeByte(6)
      ..write(obj.ranged)
      ..writeByte(7)
      ..write(obj.guard)
      ..writeByte(8)
      ..write(obj.medic)
      ..writeByte(9)
      ..write(obj.vanguard)
      ..writeByte(10)
      ..write(obj.caster)
      ..writeByte(11)
      ..write(obj.sniper)
      ..writeByte(12)
      ..write(obj.defender)
      ..writeByte(13)
      ..write(obj.supporter)
      ..writeByte(14)
      ..write(obj.specialist)
      ..writeByte(15)
      ..write(obj.healing)
      ..writeByte(16)
      ..write(obj.support)
      ..writeByte(17)
      ..write(obj.dPS)
      ..writeByte(18)
      ..write(obj.aOE)
      ..writeByte(19)
      ..write(obj.slow)
      ..writeByte(20)
      ..write(obj.survival)
      ..writeByte(21)
      ..write(obj.defense)
      ..writeByte(22)
      ..write(obj.debuff)
      ..writeByte(23)
      ..write(obj.shift)
      ..writeByte(24)
      ..write(obj.crowdControl)
      ..writeByte(25)
      ..write(obj.nuker)
      ..writeByte(26)
      ..write(obj.summon)
      ..writeByte(27)
      ..write(obj.fastRedeploy)
      ..writeByte(28)
      ..write(obj.dPRecovery)
      ..writeByte(29)
      ..write(obj.robot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OperatorHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
