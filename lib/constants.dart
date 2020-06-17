import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color(0xFFEB1555);

const kContainerMargin = 15.0;
const kRadius = 10.0;

const kIconSizeCons = 80.0;
const kSizeBoxHeight = 15.0;

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kCategoryTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kContentTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kLevelMustBeANumber = 'The rating must be a number from 1 to 90.';
const kInputFromTextfieldIsNotNumber =
    'The input for gold coins/experience books available can only be numbers.';
const kTargetLevelCannotBeLower =
    'The target level cannot be lower than or equal to the current level.';
const kLevelOutOfRange = 'The level is beyond the scope of the elite stage.';
const kExpMustBeANumber = 'Current experience must be a positive integer.';
const kExpOutOfRange =
    'The current experience is outside the possible range, please check the input.';

enum ARKError {
  None,
  LevelMustBeANumber,
  TextfieldInputMustBeANumber,
  TargetLevelError,
  LevelOutOfRange,
  ExpMustBeANumber,
  ExpOutOfRange
}

enum RecruitTag {
  Starter,
  SeniorOperator,
  TopOperator,
  Melee,
  Ranged,
  Guard,
  Medic,
  Vanguard,
  Caster,
  Sniper,
  Defender,
  Supporter,
  Specialist,
  Healing,
  Support,
  DPS,
  AOE,
  Slow,
  Survival,
  Defense,
  Debuff,
  Shift,
  CrowdControl,
  Nuker,
  Summon,
  FastRedeploy,
  DPRecovery,
  Robot,
}

// Recruit Page
const kRecruitTitle = TextStyle(
  fontSize: 15.0,
  color: Color(0xFF8D8E98),
);
