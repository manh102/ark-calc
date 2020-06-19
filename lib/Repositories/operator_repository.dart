import 'package:arklevelcalculator/entities/operator.dart';

abstract class OperatorRepository {
  Future<int> insertOperator(Operator operator);

  Future updateOperator(Operator operator);

  Future deleteOperator(int operatorId);

  Future<List<Operator>> getAllOperators();
}
