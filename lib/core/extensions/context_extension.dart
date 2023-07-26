import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ark_calc/core/navigation/app_routes.dart';
import 'package:new_ark_calc/injection_container.dart' as di;

extension BuildContextExt on BuildContext {
  Future<void> backToSignIn<T extends Object?>(
      {bool forceResetSession = true}) async {
    if (forceResetSession) {
      await di.resetSignOutSession();
    }
    GoRouter.of(this).refresh();
    this.goNamed(AppRoutes.root.namedRoute);
  }

  FutureOr<String?> redirectIfUnauthenticated() {
    bool isSignedIn = FirebaseAuth.instance.currentUser != null;

    /// TODO - remove when done
    // if (!isSignedIn) {
    //   return AppRoutes.signInPage.path;
    // }
    return null;
  }
}
