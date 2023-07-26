import 'package:flutter_easyloading/flutter_easyloading.dart';

extension StringExt on String? {
  bool isNullOrBlank() => this?.trim().isEmpty ?? true;

  Future<void> showSnackBar({
    Duration duration = const Duration(seconds: 1),
  }) async {
    await EasyLoading.showError(this ?? "",
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
        duration: duration);
  }
}
