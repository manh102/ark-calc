class Operator {
  int? id;
  String? name;
  bool? starter;
  bool? seniorOperator;
  bool? topOperator;
  bool? melee;
  bool? ranged;
  bool? guard;
  bool? medic;
  bool? vanguard;
  bool? caster;
  bool? sniper;
  bool? defender;
  bool? supporter;
  bool? specialist;
  bool? healing;
  bool? support;
  bool? dPS;
  bool? aOE;
  bool? slow;
  bool? survival;
  bool? defense;
  bool? debuff;
  bool? shift;
  bool? crowdControl;
  bool? nuker;
  bool? summon;
  bool? fastRedeploy;
  bool? dPRecovery;
  bool? robot;

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

  bool get(String tag) {
    switch (tag) {
      case "starter":
        {
          return starter ?? false;
        }

      case "seniorOperator":
        {
          return seniorOperator ?? false;
        }

      case "topOperator":
        {
          return topOperator ?? false;
        }

      case "melee":
        {
          return melee ?? false;
        }

      case "ranged":
        {
          return ranged ?? false;
        }

      case "guard":
        {
          return guard ?? false;
        }

      case "medic":
        {
          return medic ?? false;
        }

      case "vanguard":
        {
          return vanguard ?? false;
        }

      case "caster":
        {
          return caster ?? false;
        }

      case "sniper":
        {
          return sniper ?? false;
        }

      case "supporter":
        {
          return supporter ?? false;
        }

      case "specialist":
        {
          return specialist ?? false;
        }

      case "healing":
        {
          return healing ?? false;
        }

      case "support":
        {
          return support ?? false;
        }

      case "dPS":
        {
          return dPS ?? false;
        }

      case "aOE":
        {
          return aOE ?? false;
        }

      case "slow":
        {
          return slow ?? false;
        }

      case "survival":
        {
          return survival ?? false;
        }

      case "defense":
        {
          return defense ?? false;
        }

      case "debuff":
        {
          return debuff ?? false;
        }

      case "shift":
        {
          return shift ?? false;
        }

      case "crowdControl":
        {
          return crowdControl ?? false;
        }

      case "nuker":
        {
          return nuker ?? false;
        }

      case "summon":
        {
          return summon ?? false;
        }

      case "fastRedeploy":
        {
          return fastRedeploy ?? false;
        }

      case "dPRecovery":
        {
          return dPRecovery ?? false;
        }

      case "robot":
        {
          return robot ?? false;
        }
      default:
        return false;
    }
  }

  List<String> getTag() {
    List<String> tagList = [];
    if (starter == true) {
      tagList.add('starter');
    }
    if (seniorOperator == true) {
      tagList.add('seniorOperator');
    }
    if (topOperator == true) {
      tagList.add('topOperator');
    }
    if (melee == true) {
      tagList.add('melee');
    }
    if (ranged == true) {
      tagList.add('ranged');
    }
    if (guard == true) {
      tagList.add('guard');
    }
    if (medic == true) {
      tagList.add('medic');
    }
    if (vanguard == true) {
      tagList.add('vanguard');
    }
    if (caster == true) {
      tagList.add('caster');
    }
    if (sniper == true) {
      tagList.add('sniper');
    }
    if (defender == true) {
      tagList.add('defender');
    }
    if (supporter == true) {
      tagList.add('supporter');
    }
    if (specialist == true) {
      tagList.add('specialist');
    }
    if (healing == true) {
      tagList.add('healing');
    }
    if (support == true) {
      tagList.add('support');
    }
    if (dPS == true) {
      tagList.add('dPS');
    }
    if (aOE == true) {
      tagList.add('aOE');
    }
    if (slow == true) {
      tagList.add('slow');
    }
    if (survival == true) {
      tagList.add('survival');
    }
    if (defense == true) {
      tagList.add('defense');
    }
    if (debuff == true) {
      tagList.add('debuff');
    }
    if (shift == true) {
      tagList.add('shift');
    }
    if (crowdControl == true) {
      tagList.add('crowdControl');
    }
    if (nuker == true) {
      tagList.add('nuker');
    }
    if (summon == true) {
      tagList.add('summon');
    }
    if (fastRedeploy == true) {
      tagList.add('fastRedeploy');
    }
    if (dPRecovery == true) {
      tagList.add('dPRecovery');
    }
    if (robot == true) {
      tagList.add('robot');
    }
    return tagList;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'starter': starter,
        'seniorOperator': seniorOperator,
        'topOperator': topOperator,
        'melee': melee,
        'ranged': ranged,
        'guard': guard,
        'medic': medic,
        'vanguard': vanguard,
        'caster': caster,
        'sniper': sniper,
        'defender': defender,
        'supporter': supporter,
        'specialist': specialist,
        'healing': healing,
        'support': support,
        'dPS': dPS,
        'aOE': aOE,
        'slow': slow,
        'survival': survival,
        'defense': defense,
        'debuff': debuff,
        'shift': shift,
        'crowdControl': crowdControl,
        'nuker': nuker,
        'summon': summon,
        'fastRedeploy': fastRedeploy,
        'dPRecovery': dPRecovery,
        'robot': robot,
      };

  Operator convertOperator(String name, List<int> attributes) {
    var newOperator = Operator(
      name: name,
      starter: false,
      seniorOperator: false,
      topOperator: false,
      melee: false,
      ranged: false,
      guard: false,
      medic: false,
      vanguard: false,
      caster: false,
      sniper: false,
      defender: false,
      supporter: false,
      specialist: false,
      healing: false,
      support: false,
      dPS: false,
      aOE: false,
      slow: false,
      survival: false,
      defense: false,
      debuff: false,
      shift: false,
      crowdControl: false,
      nuker: false,
      summon: false,
      fastRedeploy: false,
      dPRecovery: false,
      robot: false,
    );
    for (var attribute in attributes) {
      if (attribute == 0) {
        newOperator.starter = true;
      } else if (attribute == 1) {
        newOperator.seniorOperator = true;
      } else if (attribute == 1) {
        newOperator.seniorOperator = true;
      } else if (attribute == 2) {
        newOperator.topOperator = true;
      } else if (attribute == 3) {
        newOperator.melee = true;
      } else if (attribute == 4) {
        newOperator.ranged = true;
      } else if (attribute == 5) {
        newOperator.guard = true;
      } else if (attribute == 6) {
        newOperator.medic = true;
      } else if (attribute == 7) {
        newOperator.vanguard = true;
      } else if (attribute == 8) {
        newOperator.caster = true;
      } else if (attribute == 9) {
        newOperator.sniper = true;
      } else if (attribute == 10) {
        newOperator.defender = true;
      } else if (attribute == 11) {
        newOperator.supporter = true;
      } else if (attribute == 12) {
        newOperator.specialist = true;
      } else if (attribute == 13) {
        newOperator.healing = true;
      } else if (attribute == 14) {
        newOperator.support = true;
      } else if (attribute == 15) {
        newOperator.dPS = true;
      } else if (attribute == 16) {
        newOperator.aOE = true;
      } else if (attribute == 17) {
        newOperator.slow = true;
      } else if (attribute == 18) {
        newOperator.survival = true;
      } else if (attribute == 19) {
        newOperator.defense = true;
      } else if (attribute == 20) {
        newOperator.debuff = true;
      } else if (attribute == 21) {
        newOperator.shift = true;
      } else if (attribute == 22) {
        newOperator.crowdControl = true;
      } else if (attribute == 23) {
        newOperator.nuker = true;
      } else if (attribute == 24) {
        newOperator.summon = true;
      } else if (attribute == 25) {
        newOperator.fastRedeploy = true;
      } else if (attribute == 26) {
        newOperator.dPRecovery = true;
      } else if (attribute == 27) {
        newOperator.robot = true;
      }
    }
    return newOperator;
  }

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
    int? id,
    String? name,
    bool? starter,
    bool? seniorOperator,
    bool? topOperator,
    bool? melee,
    bool? ranged,
    bool? guard,
    bool? medic,
    bool? vanguard,
    bool? caster,
    bool? sniper,
    bool? defender,
    bool? supporter,
    bool? specialist,
    bool? healing,
    bool? support,
    bool? dPS,
    bool? aOE,
    bool? slow,
    bool? survival,
    bool? defense,
    bool? debuff,
    bool? shift,
    bool? crowdControl,
    bool? nuker,
    bool? summon,
    bool? fastRedeploy,
    bool? dPRecovery,
    bool? robot,
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
