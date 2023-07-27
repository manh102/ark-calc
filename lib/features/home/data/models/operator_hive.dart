import 'package:hive/hive.dart';

part 'operator_hive.g.dart';

@HiveType(typeId: 1)
class OperatorHive {
  @HiveField(0, defaultValue: 0)
  final int id;

  @HiveField(1, defaultValue: "")
  final String name;

  @HiveField(2, defaultValue: false)
  final bool starter;
  @HiveField(3, defaultValue: false)
  final bool seniorOperator;
  @HiveField(4, defaultValue: false)
  final bool topOperator;
  @HiveField(5, defaultValue: false)
  final bool melee;
  @HiveField(6, defaultValue: false)
  final bool ranged;
  @HiveField(7, defaultValue: false)
  final bool guard;
  @HiveField(8, defaultValue: false)
  final bool medic;
  @HiveField(9, defaultValue: false)
  final bool vanguard;
  @HiveField(10, defaultValue: false)
  final bool caster;
  @HiveField(11, defaultValue: false)
  final bool sniper;
  @HiveField(12, defaultValue: false)
  final bool defender;
  @HiveField(13, defaultValue: false)
  final bool supporter;
  @HiveField(14, defaultValue: false)
  final bool specialist;
  @HiveField(15, defaultValue: false)
  final bool healing;
  @HiveField(16, defaultValue: false)
  final bool support;
  @HiveField(17, defaultValue: false)
  final bool dPS;
  @HiveField(18, defaultValue: false)
  final bool aOE;
  @HiveField(19, defaultValue: false)
  final bool slow;
  @HiveField(20, defaultValue: false)
  final bool survival;
  @HiveField(21, defaultValue: false)
  final bool defense;
  @HiveField(22, defaultValue: false)
  final bool debuff;
  @HiveField(23, defaultValue: false)
  final bool shift;
  @HiveField(24, defaultValue: false)
  final bool crowdControl;
  @HiveField(25, defaultValue: false)
  final bool nuker;
  @HiveField(26, defaultValue: false)
  final bool summon;
  @HiveField(27, defaultValue: false)
  final bool fastRedeploy;
  @HiveField(28, defaultValue: false)
  final bool dPRecovery;
  @HiveField(29, defaultValue: false)
  final bool robot;
  @HiveField(30, defaultValue: false)
  const OperatorHive({
    this.id = 0,
    this.name = "",
    this.starter = false,
    this.seniorOperator = false,
    this.topOperator = false,
    this.melee = false,
    this.ranged = false,
    this.guard = false,
    this.medic = false,
    this.vanguard = false,
    this.caster = false,
    this.sniper = false,
    this.defender = false,
    this.supporter = false,
    this.specialist = false,
    this.healing = false,
    this.support = false,
    this.dPS = false,
    this.aOE = false,
    this.slow = false,
    this.survival = false,
    this.defense = false,
    this.debuff = false,
    this.shift = false,
    this.crowdControl = false,
    this.nuker = false,
    this.summon = false,
    this.fastRedeploy = false,
    this.dPRecovery = false,
    this.robot = false,
  });
}
