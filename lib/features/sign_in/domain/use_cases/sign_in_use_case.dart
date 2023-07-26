import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_ark_calc/core/error/error_model.dart';
import 'package:new_ark_calc/core/usecases/usecase_extend.dart';
import 'package:new_ark_calc/features/sign_in/data/models/sign_in_model.dart';
import 'package:new_ark_calc/features/sign_in/domain/repositories/sign_in_repository.dart';

class SignInUseCase implements UseCaseExtend<SignInModel, SignInRequest> {
  final SignInRepository signInRepository;

  SignInUseCase(this.signInRepository);

  @override
  Future<Either<ResponseErrorModel, SignInModel>> call(
      SignInRequest params) async {
    return await signInRepository.login(
        phoneNumber: params.phoneNumber,
        countryCode: params.countryCode,
        accessToken: params.accessToken);
  }
}

class SignInRequest extends Equatable {
  final String phoneNumber;
  final String accessToken;
  final String countryCode;

//<editor-fold desc="Data Methods">
  const SignInRequest({
    required this.phoneNumber,
    required this.accessToken,
    required this.countryCode,
  });

  @override
  String toString() {
    return 'SignInRequest{' +
        ' phoneNumber: $phoneNumber,' +
        ' accessToken: $accessToken,' +
        ' countryCode: $countryCode,' +
        '}';
  }

  SignInRequest copyWith({
    String? phoneNumber,
    String? accessToken,
    String? countryCode,
  }) {
    return SignInRequest(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      accessToken: accessToken ?? this.accessToken,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': this.phoneNumber,
      'access_token': this.accessToken,
      "country_code": this.countryCode,
    };
  }

  factory SignInRequest.fromMap(Map<String, dynamic> map) {
    return SignInRequest(
      phoneNumber: map['phone'] as String,
      accessToken: map['access_token'] as String,
      countryCode: map["country_code"] as String,
    );
  }

  @override
  List<Object?> get props => [phoneNumber, countryCode, accessToken];

//</editor-fold>
}
