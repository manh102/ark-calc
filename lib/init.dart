import 'package:arklevelcalculator/Repositories/operator_repository.dart';
import 'package:arklevelcalculator/Repositories/sembast_operator_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'entities/operator.dart';

class Init {
  static Future initialize() async {
    await _initSembast();
    _registerRepositories();
    _addOperators();
  }

  static Future _initSembast() async {
    final appDir = await getApplicationDocumentsDirectory();
    print(appDir);
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "sembast.db");
    final database = await databaseFactoryIo.openDatabase(databasePath);
    GetIt.I.registerSingleton<Database>(database);
    print('init database sembast.db');
  }

  static _registerRepositories() {
    GetIt.I.registerLazySingleton<OperatorRepository>(
        () => SembastOperatorRepository());
  }

  static _addOperators() async {
    OperatorRepository _operatorRepository = GetIt.I.get();

    final newOperators = [
      Operator().convertOperator("12F", [0, 4, 8]),
      Operator().convertOperator("Adnachiel", [4, 15, 9]),
      Operator().convertOperator("Ansel", [4, 13, 6]),
      Operator().convertOperator("Beagle", [3, 19, 10]),
      Operator().convertOperator("Blue Poison", [4, 15, 1, 9]),
      Operator().convertOperator("Castle-3", [3, 14, 27, 5]),
      Operator().convertOperator("Cliffheart", [15, 3, 21, 1, 12]),
      Operator().convertOperator("Croissant", [3, 21, 19, 1, 10]),
      Operator().convertOperator("Cuora", [3, 19, 10]),
      Operator().convertOperator("Dobermann", [3, 14, 15, 5]),
      Operator().convertOperator("Durin", [0, 4, 8]),
      Operator().convertOperator("Earthspirit", [4, 17, 11]),
      Operator().convertOperator("Estelle", [3, 16, 18, 5]),
      Operator().convertOperator("Exusiai", [4, 15, 1, 2, 9]),
      Operator().convertOperator("Fang", [3, 26, 7]),
      Operator().convertOperator("FEater", [17, 3, 21, 1, 12]),
      Operator().convertOperator("Firewatch", [4, 15, 23, 1, 9]),
      Operator().convertOperator("Frostleaf", [3, 17, 15, 5]),
      Operator().convertOperator("Gitano", [4, 16, 8]),
      Operator().convertOperator("Gravel", [3, 25, 19, 12]),
      Operator().convertOperator("Haze", [20, 4, 15, 8]),
      Operator().convertOperator("Hibiscus", [4, 13, 6]),
      Operator().convertOperator("Hoshiguma", [3, 15, 19, 1, 2, 10]),
      Operator().convertOperator("Ifrit", [4, 16, 20, 1, 2, 8]),
      Operator().convertOperator("Indra", [4, 15, 18, 1, 5]),
      Operator().convertOperator("Jessica", [4, 15, 18, 9]),
      Operator().convertOperator("Kroos", [4, 15, 9]),
      Operator().convertOperator("Lancet-2", [4, 13, 27, 6]),
      Operator().convertOperator("Lava", [4, 16, 8]),
      Operator().convertOperator("Liskarm", [3, 19, 15, 1, 10]),
      Operator().convertOperator("Manticore", [18, 3, 15, 1, 12]),
      Operator().convertOperator("Matoimaru", [15, 3, 18, 5]),
      Operator().convertOperator("Matterhorn", [3, 19, 10]),
      Operator().convertOperator("Mayer", [4, 24, 22, 1, 11]),
      Operator().convertOperator("Melantha", [3, 15, 18, 5]),
      Operator().convertOperator("Meteor", [4, 15, 20, 9]),
      Operator().convertOperator("Meteorite", [4, 16, 20, 1, 9]),
      // Dang lam do
      Operator().convertOperator("Mousse", [0, 4, 8]),
      Operator().convertOperator("Myrrh", [0, 4, 8]),
      Operator().convertOperator("Nearl", [0, 4, 8]),
      Operator().convertOperator("Nightingale", [0, 4, 8]),
      Operator().convertOperator("Noir Corne", [0, 4, 8]),
      Operator().convertOperator("Orchid", [0, 4, 8]),
      Operator().convertOperator("Perfumer", [0, 4, 8]),
      Operator().convertOperator("Platinum", [0, 4, 8]),
      Operator().convertOperator("Plume", [0, 4, 8]),
      Operator().convertOperator("Pramanix", [0, 4, 8]),
      Operator().convertOperator("Projekt Red", [0, 4, 8]),
      Operator().convertOperator("Provence", [0, 4, 8]),
      Operator().convertOperator("Ptilopsis", [0, 4, 8]),
      Operator().convertOperator("Rangers", [0, 4, 8]),
      Operator().convertOperator("Rope", [0, 4, 8]),
      Operator().convertOperator("Saria", [0, 4, 8]),
      Operator().convertOperator("Scavenger", [0, 4, 8]),
      Operator().convertOperator("Shaw", [0, 4, 8]),
      Operator().convertOperator("Shining", [0, 4, 8]),
      Operator().convertOperator("ShiraYuki", [0, 4, 8]),
      Operator().convertOperator("Siege", [0, 4, 8]),
      Operator().convertOperator("Silence", [0, 4, 8]),
      Operator().convertOperator("SilverAsh", [0, 4, 8]),
      Operator().convertOperator("Specter", [0, 4, 8]),
      Operator().convertOperator("Steward", [0, 4, 8]),
      Operator().convertOperator("Texas", [0, 4, 8]),
      Operator().convertOperator("Vanilla", [0, 4, 8]),
      Operator().convertOperator("Vigna", [0, 4, 8]),
      Operator().convertOperator("Vulcan", [0, 4, 8]),
      Operator().convertOperator("Warfarin", [0, 4, 8]),
      Operator().convertOperator("Yato", [0, 4, 8]),
      Operator().convertOperator("Гум", [0, 4, 8]),
      Operator().convertOperator("Зима", [0, 4, 8]),
      Operator().convertOperator("Истина", [0, 4, 8]),
    ];
    for (var operator in newOperators) {
      await _operatorRepository.insertOperator(operator);
    }
  }
}
