import 'package:flutter_test/flutter_test.dart';

abstract class BaseIntegrationTest {
  void initDependencies(WidgetTester tester);
}

abstract class DescendantIntegrationTest {
  Future<void> perform(WidgetTester tester);

  void group() {}
}
