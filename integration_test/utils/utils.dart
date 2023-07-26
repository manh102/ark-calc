import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExt on WidgetTester {
  Future<void> pumpRepeat({
    int times = 2,
    Duration initial = Duration.zero,
    Duration interval = const Duration(milliseconds: 500),
  }) {
    return TestAsyncUtils.guard<void>(() async {
      assert(times >= 2, 'If [times] is 1, please use [pump] instead.');
      await pump(initial);
      int i = 1;
      while (i < times) {
        await pump(interval);
        i++;
      }
    });
  }

  Future<void> pumpWithTimeout([
    Duration timeout = const Duration(seconds: 30),
    Duration interval = const Duration(milliseconds: 100),
  ]) {
    return pumpAndSettle(
      interval,
      EnginePhase.sendSemanticsUpdate,
      timeout,
    );
  }
}

/// After reading source code of [WidgetTester], we've found out that we actually
/// don't need a [WidgetTester] to get components from a [Finder].
/// This [FinderExt] extension can be used to make our code less coupled.
extension FinderExt on Finder {
  bool any() => evaluate().isNotEmpty;

  T widget<T extends Widget>() => evaluate().single.widget as T;

  T state<T extends State>() =>
      (evaluate().single as StatefulElement).state as T;
}

extension CommonFinderExt on CommonFinders {
  Finder customWidget<TWidget, TValue>(
      bool Function(TWidget widget) predicate) {
    return find.byWidgetPredicate(
        (widget) => widget is TWidget && predicate.call(widget as TWidget));
  }
}

void testWidgetsIgnoredExceptions(
  List<Type> exceptionsIgnore,
  String description,
  WidgetTesterCallback callback, {
  bool? skip,
}) {
  testWidgetsIgnored(
    description,
    callback,
    skip: skip ?? false,
    errors: exceptionsIgnore,
  );
}

/*
      {
        "name": "vn-integration-test (debug mode)",
        "request": "launch",
        "type": "dart",
        "program": "integration_test/run_all_integration_test.dart",
        "args": [
          "--flavor",
          "vnTest"
        ]
      }
 */

void testWidgetsIgnoredImageException(
  String description,
  WidgetTesterCallback callback, {
  bool? skip,
}) {
  testWidgetsIgnored(
    description,
    callback,
    skip: skip ?? false,
    errors: [NetworkImageLoadException, HandshakeException, HttpException],
  );
}

/// This [testWidgets] ignores specified [errors] by overriding [FlutterError.onError].
void testWidgetsIgnored(
  String description,
  WidgetTesterCallback callback, {
  bool skip = false,
  List<Type> errors = const [],
}) {
  testWidgets(
    description,
    (tester) async {
      final originalOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails details) {
        if (errors.contains(details.exception.runtimeType)) return;
        originalOnError!(details);
      };
      await callback(tester);
    },
    skip: skip,
  );
}
