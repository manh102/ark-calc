import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ark_calc/core/extensions/extension_dimens.dart';
import 'package:new_ark_calc/core/navigation/app_routes.dart';
import 'package:new_ark_calc/core/resources/resources.dart';
import 'package:new_ark_calc/core/widgets/dialog/dialog.dart';
import 'package:new_ark_calc/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:new_ark_calc/features/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:new_ark_calc/features/sign_in/presentation/widgets/sign_in_widgets_mixin.dart';

import '../../../../core/widgets/common/buttons/soloer_button_widget.dart';
import '../../../../core/widgets/common/edit_text_widget.dart';
import '../../../../core/widgets/common/soloer_text_widget.dart';
import '../widgets/social_auth_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SignInWidgetsMixin {
  late SignInBloc signInBloc;
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHidePassword = true;

  @override
  void initState() {
    EasyLoading.dismiss();
    signInBloc = context.read<SignInBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) async {
        if (state is SignInLoading) {
          await EasyLoading.show();
        }

        if (state is SignInError) {
          await PSDialog.instance.showErrorDialog(
              context: context,
              messageCode: state.messageCode,
              messageContent: state.messageContent);
        }

        if (state is SignInOtpCodeSentSuccess) {
          GoRouter.of(context).pushNamed(AppRoutes.verifyOtpPage.namedRoute,
              extra: {"phoneNumber": signInBloc.phoneNumber});
        }
      },
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder(
      bloc: signInBloc,
      builder: (context, state) {
        if (EasyLoading.isShow && !(state is SignInError)) {
          EasyLoading.dismiss();
        }

        return _buildContentlogin();
      },
    );
  }

  Widget _buildContentlogin() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 40.dimension()),
        child: Column(
          children: <Widget>[
            // Textfield and login button
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0.dimension(), right: 25.0.dimension()),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: buildButtonSkip(context: context),
                  ),
                  SizedBox(height: 0.0),
                  _buildLogo(),
                  SizedBox(height: 30.0),
                  _buildLoginTitle(),
                  SizedBox(height: 25.0),
                  _buildUsername(),
                  SizedBox(height: 20.0),
                  _buildPassword(),
                  SizedBox(height: 10.0),
                  _buildForgotPassword(),
                  SizedBox(height: 30.0),
                  _buildLoginBtn(),
                  SizedBox(height: 10.0),
                  _buildSignupNow(),
                  SizedBox(height: 10.0),
                  SocialAuthWidget(
                    onAuthByFacebookSuccess: (token, email) {
                      // controller.callLoginSocialApi('facebook', token,
                      //     email: email);
                    },
                    onAuthByGoogleSuccess: (token, email) {
                      // controller.callLoginSocialApi('google', token,
                      //     email: email);
                    },
                    onAuthByAppleIdSuccess:
                        (token, familyName, givenName, email) {
                      // controller.callLoginSocialApi('apple', token,
                      //     email: email);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginTitle() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          TextWidget(
            textButton: 'LOGIN_TOP_TITLE'.tr(),
            fontSize: DimenFont.sp32,
            fontFamily: 'ProductSansBold',
            textColor: SoloerColors.text_black,
            alignment: Alignment.center,
          ),
          SizedBox(height: 10.0),
          TextWidget(
            textButton: 'LOGIN_WELCOME_TEXT'.tr(),
            fontSize: DimenFont.sp14,
            textColor: SoloerColors.text_black,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget _buildUsername() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: EditTextWidget(
        textController: accountController,
        hintText: 'YOUR_EMAIL'.tr(),
        obscureText: false,
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: EditTextWidget(
        textController: passwordController,
        hintText: 'PASSWORD'.tr(),
        svgImage: isHidePassword
            ? 'assets/images/svg/eye_close_ic.svg'
            : 'assets/images/svg/eye_open_ic.svg',
        obscureText: isHidePassword,
        onTapRightIcon: () {
          print('Tapped on Right Icon of textfield');
          //controller.isHidePassword.value = !controller.isHidePassword.value;
        },
      ),
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
      child: TextWidget(
        alignment: Alignment.centerRight,
        textButton: 'DID_FORGOT_PASSWORD'.tr(),
        fontSize: DimenFont.sp10,
        textColor: SoloerColors.color_919191,
      ),
      onTap: () {
        print("Tapped on Forgot Password link");
        //NavigatorUtils.offNamed(ForgotPassWordRoute.forgotPassWord);
      },
    );
  }

  Widget _buildLoginBtn() {
    return ButtonWidget(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)),
      textButton: 'LOGIN'.tr(),
      fontSize: DimenFont.sp14,
      fontWeight: FontWeight.bold,
      backgroundColor: Color(0xFF0EBE2C),
      spaceBetweenCharacter: 1.5,
      clickButtonCallBack: () => {
        //controller.clickLogin()
      },
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 89,
      height: 134,
      child: Image.asset('assets/images/png/soloer_logo.png'),
    );
  }

  Widget _buildSignupNow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            textButton: 'DID_HAVE_ACCOUNT'.tr(),
            fontSize: DimenFont.sp14,
            textColor: SoloerColors.color_919191,
          ),
          SizedBox(width: 5.0),
          GestureDetector(
            child: TextWidget(
              textButton: 'REGISTER_NOW'.tr(),
              fontSize: DimenFont.sp14,
              textDecoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              textColor: SoloerColors.color_3d5cfa,
            ),
            onTap: () {
              print("Tapped on Signup Now link");
              // NavigatorUtils.offNamed(RegisterRoute.register,
              //     arguments: ['onRegisterRoute']);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
