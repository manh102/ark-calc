import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/util/repository_mixin.dart';
import 'package:new_ark_calc/features/sign_in/data/datasources/sign_in_remote_data_source.dart';
import 'package:new_ark_calc/features/sign_in/data/models/sign_in_model.dart';
import 'package:new_ark_calc/features/sign_in/domain/repositories/sign_in_repository.dart';

import '../datasources/sign_in_local_data_source.dart';

class SignInRepositoryImpl extends SignInRepository with RepositoryMixin {
  final SignInRemoteDataSource signInRemoteDataSource;
  final SignInLocalDataSource signInLocalDataSource;

  SignInRepositoryImpl(this.signInRemoteDataSource, this.signInLocalDataSource);

  @override
  Future<Either<ResponseErrorModel, SignInModel>> login(
      {required String phoneNumber,
      required String countryCode,
      required String accessToken}) async {
    return executeTask<SignInModel>(
      () async {
        final signInModel = await signInRemoteDataSource.login(
            phoneNumber: phoneNumber,
            countryCode: countryCode,
            accessToken: accessToken);
        await signInLocalDataSource.storeSignedInUser(signInModel: signInModel);
        return signInModel;
      },
    );
  }
}
