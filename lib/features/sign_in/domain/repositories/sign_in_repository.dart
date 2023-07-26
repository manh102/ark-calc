import 'package:dartz/dartz.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/features/sign_in/data/models/sign_in_model.dart';

abstract class SignInRepository {
  Future<Either<ResponseErrorModel, SignInModel>> login(
      {required String phoneNumber,
      required String countryCode,
      required String accessToken});
}
