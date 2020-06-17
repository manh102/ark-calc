import 'package:arklevelcalculator/entities/operator.dart';

abstract class OperatorRepository {
  Future<int> insertCake(Operator operator);

  Future updateCake(Operator operator);

  Future deleteCake(int operatorId);

  Future<List<Operator>> getAllOperators();
}
