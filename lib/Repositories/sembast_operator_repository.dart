import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:arklevelcalculator/entities/operator.dart';
import 'package:arklevelcalculator/Repositories/operator_repository.dart';

class SembastOperatorRepository extends OperatorRepository {
  final Database _database = GetIt.I.get();
  final StoreRef _list = intMapStoreFactory.store("operator_list");

  @override
  Future<int> insertOperator(Operator operator) async {
    return await _list.add(_database, operator.toMap());
  }

  @override
  Future updateOperator(Operator operator) async {
    await _list.record(operator.id).update(_database, operator.toMap());
  }

  @override
  Future deleteOperator(int operatorId) async {
    await _list.record(operatorId).delete(_database);
  }

  @override
  Future<Operator> getOperator(String targetName) async {
    var finder = Finder(
      filter: Filter.equals("name", targetName),
    );
    var snapshots = await _list.find(_database, finder: finder);
    return snapshots
        .map((snapshot) => Operator.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false)
        .first;
  }

  @override
  Future<List<Operator>> getAllOperators() async {
    final snapshots = await _list.find(_database);
    return snapshots
        .map((snapshot) => Operator.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false);
  }

  @override
  Future<List<Operator>> getOperatorsByTag(String tag) async {
    print("repository get OP by tag");
    print(tag);
    var finder = Finder(
      filter: Filter.equals(tag, true),
    );
    // 3 mean top operator
    if (tag != "topOperator") {
      finder = Finder(
          filter: Filter.and(
              [Filter.equals(tag, true), Filter.equals("topOperator", false)]));
    }
    var snapshots = await _list.find(_database, finder: finder);
    return snapshots
        .map((snapshot) => Operator.fromMap(snapshot.key, snapshot.value))
        .toList(growable: false);
  }
}
