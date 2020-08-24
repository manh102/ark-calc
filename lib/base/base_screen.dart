import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:arklevelcalculator/localization/app_translations.dart';
import 'package:arklevelcalculator/resources/app_color.dart';
import 'package:arklevelcalculator/resources/app_font.dart';
import 'package:arklevelcalculator/resources/app_lang.dart';
import 'package:arklevelcalculator/schema/api_message.dart';
import 'package:arklevelcalculator/type/view_state.dart';
import 'package:arklevelcalculator/util/ui_util.dart';
import 'package:arklevelcalculator/widget/app_empty_widget.dart';
import 'package:arklevelcalculator/widget/app_error_widget.dart';
import 'package:arklevelcalculator/widget/app_loading_widget.dart';
import 'package:arklevelcalculator/widget/dialog/confirm_dialog_widget.dart';
import 'package:arklevelcalculator/widget/dialog/error_dialog_widget.dart';
import 'package:arklevelcalculator/widget/dialog/success_dialog_widget.dart';
import 'package:arklevelcalculator/widget/progress_dialog.dart';

import 'base_viewmodel.dart';

abstract class BaseScreen<T extends StatefulWidget> extends State<T> {
  ProgressDialog pr;

  String getStringFromRes(String key) => AppTranslations.of(context).text(key);

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  AppBar buildPreferredSize(String title) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(fontFamily: AppFont.sfprodisplay_bold, fontSize: 16.0),
      ),
      backgroundColor: Colors.red,
    );
  }

  Widget buildTopSpacing(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget buildLine() {
    return Container(
      width: double.infinity,
      height: 0.2,
      color: AppColor.searchBoxTextColor,
    );
  }

  Widget getLoadingView() => AppLoadingWidget();

  Widget buildEmptyView(String message, VoidCallback onRefresh,
      {String retryLabel}) {
    return AppEmptyWidget(
      emptyMessage: message,
      onRefresh: onRefresh,
      retryLabel: retryLabel,
    );
  }

  Widget buildDataViewWithRefresh(
    Widget child,
    RefreshController refreshController,
    VoidCallback onRefresh, {
    VoidCallback onLoadMore,
  }) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: onLoadMore != null,
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      header: WaterDropMaterialHeader(
        backgroundColor: AppColor.mainColor,
      ),
      footer: ClassicFooter(
        textStyle: TextStyle(
          fontSize: 14,
        ),
        idleText: getStringFromRes(AppLang.common_load_more),
        canLoadingText: getStringFromRes(AppLang.common_load_more_confirm),
        loadingIcon: SpinKitThreeBounce(
          color: AppColor.mainColor,
          size: 30,
        ),
        loadingText: '',
      ),
      child: child,
    );
  }

  Widget buildContainerViewByStatus(
    BaseViewModel viewModel,
    Widget contentView,
    VoidCallback onRetry,
  ) {
    Widget mainView = Container();

    switch (viewModel.viewState) {
      case ViewState.Idle:
        mainView = Container();
        break;

      case ViewState.Loading:
        mainView = getLoadingView();
        break;

      case ViewState.Loaded:
      case ViewState.Refreshing:
        mainView = contentView;
        break;

      case ViewState.Error:
        mainView = AppErrorWidget(onRetry: onRetry);
    }

    return mainView;
  }

  void showLoadingDialog() async {
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: false,
    );

    pr.style(
      message: getStringFromRes(AppLang.common_loading),
      progressWidget: SpinKitThreeBounce(
        color: AppColor.mainColor,
        size: 30,
      ),
    );

    pr.show();
  }

  void hideLoadingDialog() {
    if (pr != null && pr.isShowing()) {
      pr.dismiss();
    }
  }

  void showInfoDialog(String title, String contentText,
      {VoidCallback onDismiss, bool barrierDismissible = true}) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(contentText),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                  getStringFromRes(AppLang.common_dialog_confirmation)),
              onPressed: onDismiss != null
                  ? onDismiss
                  : () {
                      Navigator.of(context).pop();
                    },
            ),
          ],
        );
      },
    );
  }

  void showToastMsg(String msg, {bool isErrorMsg = false}) {
    UiUtil.showToastMsg(msg, isErrorMsg: isErrorMsg);
  }

  void showErrorDialog({
    String title,
    List<ApiMessage> errors,
    String content,
    VoidCallback onRetry,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ErrorDialogWidget(
        title: title,
        content: content,
        errors: errors,
        onClose: onRetry,
      ),
    );
  }

  void showSuccessDialog({
    String title,
    String content,
    bool barrierDismissible = true,
    VoidCallback onClose,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) => SuccessDialogWidget(
        title: title,
        content: content,
        onClose: onClose,
      ),
    );
  }

  void showConfirmDialog({
    String title,
    String content,
    VoidCallback onConfirm,
    VoidCallback onCancel,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ConfirmDialogWidget(
        title: title,
        content: content,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }
}
