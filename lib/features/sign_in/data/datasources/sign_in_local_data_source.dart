import 'package:new_ark_calc/core/secure_storage/user_secure_storage.dart';
import 'package:new_ark_calc/features/sign_in/data/models/sign_in_model.dart';

abstract class SignInLocalDataSource {
  Future<void> storeSignedInUser({required SignInModel signInModel});
}

class SignInLocalDataSourceImpl extends SignInLocalDataSource {
  final UserSecureStorage userSecureStorage;

  SignInLocalDataSourceImpl(this.userSecureStorage);

  @override
  Future<void> storeSignedInUser({required SignInModel signInModel}) async {
    await userSecureStorage.setAccessToken(signInModel.token);
    await userSecureStorage.setRefreshToken(signInModel.refresh);
    await userSecureStorage.setUserId(signInModel.userId.toString());
  }
}
