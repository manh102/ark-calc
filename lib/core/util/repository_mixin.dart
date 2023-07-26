import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../error/error_model.dart';
import '../error/exceptions.dart';
import 'connection_util.dart';
import 'error_code.dart';

typedef OnMainJob<T> = Future<T?> Function();

mixin RepositoryMixin {
  Future<Either<ResponseErrorModel, T>> executeTask<T>(OnMainJob<T?> onMainJob) async {
    if (await InternetConnection.instance.isHasConnection()) {
      try {
        final result = await onMainJob.call();
        return right(result!);
      } on SocketException {
        return Left(ResponseErrorModel(
            msgCode: ErrorCode.MA001CE, msgContent: ErrorCode.MA001CE.tr()));
      } on ServerException catch (error) {
        return Left(
            ResponseErrorModel(msgCode: error.code, msgContent: error.content));
      } on Exception {
        return Left(ResponseErrorModel(
            msgCode: ErrorCode.MA001CE, msgContent: ErrorCode.MA001CE.tr()));
      }
    } else {
      return Left(ResponseErrorModel(
          msgCode: ErrorCode.MA001CE, msgContent: ErrorCode.MA001CE.tr()));
    }
  }
}