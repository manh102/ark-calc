import 'package:easy_localization/easy_localization.dart';
import 'package:integration_test/integration_test.dart';
import 'package:new_ark_calc/main_common.dart';
import 'package:new_ark_calc/main_vn_dev.dart' as app;
import 'package:flutter_test/flutter_test.dart';

import '../base/base_actions.dart';

class AppActions extends BaseActions {
  final WidgetTester _tester;

  static bool isInItApp = false;

  AppActions(this._tester) : super(_tester);

  Future<void> initApp() async {
    IntegrationTestWidgetsFlutterBinding
        .ensureInitialized(); // init LiveTestWidgetsFlutterBinding
    TestWidgetsFlutterBinding.ensureInitialized();

    if (!isInItApp) {
      app.main();
    }
    // should initialize Localization first to be able to render widget
    await EasyLocalization.ensureInitialized();
    // WidgetsFlutterBinding.ensureInitialized();
    await _tester.pumpWidget(MyApp(), Duration(seconds: 3));
    await _tester.pumpAndSettle();
    await _tester.pump(Duration(seconds: 3));

    isInItApp = true;
  }
}
