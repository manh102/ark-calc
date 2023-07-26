import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_ark_calc/core/util/core_util.dart';

class PSNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logging.log.info("didPush");
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    Logging.log.info("didReplace");
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logging.log.info("didRemove");
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logging.log.info("didPop");
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }
}
