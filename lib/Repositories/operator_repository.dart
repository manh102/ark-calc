import 'package:arklevelcalculator/entities/operator.dart';

abstract class OperatorRepository {
  Future<int> insertOperator(Operator operator);

  Future updateOperator(Operator operator);

  Future deleteOperator(int operatorId);

  Future<Operator> getOperator(String targetName);

  Future<List<Operator>> getAllOperators();

  Future<List<Operator>> getOperatorsByTag(String tag);
}
