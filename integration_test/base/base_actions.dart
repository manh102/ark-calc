import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

abstract class BaseActions {
  final WidgetTester tester;

  BaseActions(this.tester);

  Future<void> tap(Finder button, {bool shouldSettle = true}) async {
    await tester.tap(button);
    if (shouldSettle) {
      await tester.pumpAndSettle(const Duration(seconds: 1));
    } else {
      await tester.pump();
    }
  }

  Future<void> scrollToFinder(Finder scrollViewFinder, Offset offSet) async {
    await tester.drag(scrollViewFinder, offSet);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> fillText(Finder widget, String text) async {
    await tester.enterText(widget, text);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> enterText(Finder finder, String text) async {
    await tester.enterText(finder, text);
    await tester.pumpWithTimeout();
  }

  Future<void> tapTimeOut(Finder finder) async {
    await tester.tap(finder);
    await tester.pumpWithTimeout();
  }

  static String getAssetName(Image image) {
    if (image.image is AssetImage) {
      return (image.image as AssetImage).assetName;
    }
    return "";
  }
}
