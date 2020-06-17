class Operator {
  final int id;
  final String name;
  final bool starter;
  final bool seniorOperator;
  final bool topOperator;
  final bool melee;
  final bool ranged;
  final bool guard;
  final bool medic;
  final bool vanguard;
  final bool caster;
  final bool sniper;
  final bool defender;
  final bool supporter;
  final bool specialist;
  final bool healing;
  final bool support;
  final bool dPS;
  final bool aOE;
  final bool slow;
  final bool survival;
  final bool defense;
  final bool debuff;
  final bool shift;
  final bool crowdControl;
  final bool nuker;
  final bool summon;
  final bool fastRedeploy;
  final bool dPRecovery;
  final bool robot;

  Operator({
    this.id,
    this.name,
    this.starter,
    this.seniorOperator,
    this.topOperator,
    this.melee,
    this.ranged,
    this.guard,
    this.medic,
    this.vanguard,
    this.caster,
    this.sniper,
    this.defender,
    this.supporter,
    this.specialist,
    this.healing,
    this.support,
    this.dPS,
    this.aOE,
    this.slow,
    this.survival,
    this.defense,
    this.debuff,
    this.shift,
    this.crowdControl,
    this.nuker,
    this.summon,
    this.fastRedeploy,
    this.dPRecovery,
    this.robot,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'starter': this.starter,
      'seniorOperator': this.seniorOperator,
      'topOperator': this.topOperator,
      'melee': this.melee,
      'ranged': this.ranged,
      'guard': this.guard,
      'medic': this.medic,
      'vanguard': this.vanguard,
      'caster': this.caster,
      'sniper': this.sniper,
      'defender': this.defender,
      'supporter': this.support,
      'specialist': this.specialist,
      'healing': this.healing,
      'support': this.support,
      'dPS': this.dPS,
      'aOE': this.aOE,
      'slow': this.slow,
      'survival': this.survival,
      'defense': this.defense,
      'debuff': this.debuff,
      'shift': this.shift,
      'crowdControl': this.crowdControl,
      'nuker': this.nuker,
      'summon': this.summon,
      'fastRedeploy': this.fastRedeploy,
      'dPRecovery': this.dPRecovery,
      'robot': this.robot,
    };
  }

  factory Operator.fromMap(int id, Map<String, dynamic> map) {
    return Operator(
      id: id,
      name: map['name'],
      starter: map['starter'],
      seniorOperator: map['seniorOperator'],
      topOperator: map['topOperator'],
      melee: map['melee'],
      ranged: map['ranged'],
      guard: map['guard'],
      medic: map['medic'],
      vanguard: map['vanguard'],
      caster: map['caster'],
      sniper: map['sniper'],
      defender: map['defender'],
      supporter: map['supporter'],
      specialist: map['specialist'],
      healing: map['healing'],
      support: map['support'],
      dPS: map['dPS'],
      aOE: map['aOE'],
      slow: map['slow'],
      survival: map['survival'],
      defense: map['defense'],
      debuff: map['debuff'],
      shift: map['shift'],
      crowdControl: map['crowdControl'],
      nuker: map['nuker'],
      summon: map['summon'],
      fastRedeploy: map['fastRedeploy'],
      dPRecovery: map['dPRecovery'],
      robot: map['robot'],
    );
  }

  Operator copyWith({
    int id,
    String name,
    bool starter,
    bool seniorOperator,
    bool topOperator,
    bool melee,
    bool ranged,
    bool guard,
    bool medic,
    bool vanguard,
    bool caster,
    bool sniper,
    bool defender,
    bool supporter,
    bool specialist,
    bool healing,
    bool support,
    bool dPS,
    bool aOE,
    bool slow,
    bool survival,
    bool defense,
    bool debuff,
    bool shift,
    bool crowdControl,
    bool nuker,
    bool summon,
    bool fastRedeploy,
    bool dPRecovery,
    bool robot,
  }) {
    return Operator(
      id: id ?? this.id,
      name: name ?? this.name,
      starter: starter ?? this.starter,
      seniorOperator: seniorOperator ?? this.seniorOperator,
      topOperator: topOperator ?? this.topOperator,
      melee: melee ?? this.melee,
      ranged: ranged ?? this.ranged,
      guard: guard ?? this.guard,
      medic: medic ?? this.medic,
      vanguard: vanguard ?? this.vanguard,
      caster: caster ?? this.caster,
      sniper: sniper ?? this.sniper,
      defender: defender ?? this.defender,
      supporter: supporter ?? this.supporter,
      specialist: specialist ?? this.specialist,
      healing: healing ?? this.healing,
      support: support ?? this.support,
      dPS: dPS ?? this.dPS,
      aOE: aOE ?? this.aOE,
      slow: slow ?? this.slow,
      survival: survival ?? this.survival,
      defense: defense ?? this.defense,
      debuff: debuff ?? this.debuff,
      shift: shift ?? this.shift,
      crowdControl: crowdControl ?? this.crowdControl,
      nuker: nuker ?? this.nuker,
      summon: summon ?? this.summon,
      fastRedeploy: fastRedeploy ?? this.fastRedeploy,
      dPRecovery: dPRecovery ?? this.dPRecovery,
      robot: robot ?? this.robot,
    );
  }
}
