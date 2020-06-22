import 'package:arklevelcalculator/constants.dart';
import 'package:get_it/get_it.dart';

import 'Repositories/operator_repository.dart';

class RecruitCalculate {
  List<RecruitTag> tags = [];
  OperatorRepository _operatorRepository = GetIt.I.get();
  List<String> listOperators = [];
  List<String> tagList2 = [];

  List getPossibleNames() {
    return ['Texas', 'Shining'];
  }

  Future<List<String>> loadOperators() async {
    listOperators = [];
    print('Load all ');
    final operators = await _operatorRepository.getAllOperators();

    listOperators.add(operators[0].name);
    listOperators.add(operators[1].name);
    listOperators.add(operators[2].name);
    listOperators.add(operators[3].name);

    return listOperators;
  }

  Future<List<String>> searchOperators(List<String> tagList) async {
    listOperators = [];
    print('get OP by tag');

    for (final tag in tagList) {
      final operators = await _operatorRepository.getOperatorsByTag(tag);
      for (final operator in operators) {
        listOperators.add(operator.name);
      }
    }

    print(listOperators);
    return listOperators;
  }
}
