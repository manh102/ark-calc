import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../../../core/resources/resources.dart';

// Decoration
TextStyle snsTextStyle = TextStyle(
  fontSize: DimenFont.sp14,
  fontWeight: FontWeight.bold,
  fontFamily: 'ProductSansRegular',
);

class SocialAuthWidget extends StatefulWidget {
  final Function(String, String) onAuthByFacebookSuccess;
  final Function(String, String) onAuthByGoogleSuccess;
  final Function(String, String, String, String) onAuthByAppleIdSuccess;

  SocialAuthWidget({
    required this.onAuthByFacebookSuccess,
    required this.onAuthByGoogleSuccess,
    required this.onAuthByAppleIdSuccess,
  });

  @override
  _SocialAuthWidgetState createState() => _SocialAuthWidgetState();
}

class _SocialAuthWidgetState extends State<SocialAuthWidget> {
  List<Widget> _icons = [];

  @override
  void initState() {
    super.initState();
    _getSocialIconList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _icons,
      ),
    );
  }

  _getSocialIconList() async {
    List<Widget> icons = [];

    // Apple sign in
    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var version = iosInfo.systemVersion;
      if (version!.contains('13') == true ||
          version.contains('14') == true ||
          version.contains('15') == true ||
          version.contains('16') == true) {
        icons.addAll([
          InkWell(
            onTap: () {
              print("Tapped on Apple icon");
              _authByAppleId();
            },
            child: _buildSocialIcon(type: 2),
          ),
          SizedBox(height: 10.0),
        ]);
      }
    }

    // Goolge and Facebook sign in
    icons.addAll([
      InkWell(
        onTap: () {
          print("Tapped on Facebook icon");
          _authByFacebook();
        },
        child: _buildSocialIcon(type: 1),
      ),
      SizedBox(height: 10.0),
      InkWell(
        onTap: () {
          print("Tapped on Google icon");
          _authByGoogle();
        },
        child: _buildSocialIcon(type: 0),
      ),
    ]);

    setState(() {
      _icons = icons;
    });
  }

  Widget _buildSocialIcon({int type = 0}) {
    switch (type) {
      case 0:
        return Container(
          padding: EdgeInsets.only(top: 8.0, left: 20.0, bottom: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: SoloerColors.darkPastelGreen),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: double.infinity,
          height: 42.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('assets/images/png/google_ic.png'),
              ),
              Center(
                child: Text(
                  'Tiếp tục với Google',
                  style: snsTextStyle,
                ),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          padding: EdgeInsets.only(top: 8.0, left: 20.0, bottom: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: SoloerColors.darkPastelGreen),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: double.infinity,
          height: 42.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('assets/images/png/facebook_ic.png'),
              ),
              Center(
                child: Text(
                  'Tiếp tục với Facebook',
                  style: snsTextStyle,
                ),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          padding: EdgeInsets.only(top: 8.0, left: 15.0, bottom: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: SoloerColors.darkPastelGreen),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: double.infinity,
          height: 42.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  'assets/images/svg/apple_ic.svg',
                  //height: Dimens.size20,
                ),
              ),
              Center(
                child: Text(
                  'Tiếp tục với Apple',
                  style: snsTextStyle,
                ),
              ),
            ],
          ),
        );
      default:
        return Container(
          padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: SoloerColors.darkPastelGreen),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: double.infinity,
          height: 42.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  'assets/images/svg/google_ic.svg',
                  // height: Dimens.size20,
                ),
              ),
              Center(
                child: Text(
                  'Tiếp tục với Google',
                  style: snsTextStyle,
                ),
              ),
            ],
          ),
        );
    }
  }

  void _authByFacebook() async {
    // Create an instance of FacebookLogin
    final fb = FacebookLogin();

    // Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    // Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        // Logged in

        // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = res.accessToken;
        // Get profile data
        final email = await fb.getUserEmail();
        if (accessToken != null) {
          print('Access token: ${accessToken.token}');
          widget.onAuthByFacebookSuccess(accessToken.token, email ?? '');
        }

        // // Get profile data
        // final profile = await fb.getUserProfile();
        // print('Hello, ${profile.name}! You ID: ${profile.userId}');

        // // Get user profile image url
        // final imageUrl = await fb.getProfileImageUrl(width: 100);
        // print('Your profile image: $imageUrl');

        // // Get email (since we request email permission)
        // final email = await fb.getUserEmail();
        // // But user can decline permission
        // if (email != null) print('And your email is $email');
        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
  }

  void _authByGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>['email', 'profile'],
    );

    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      //AppLogger.d(googleSignInAuthentication);
      print(googleSignInAuthentication.accessToken ?? 'NO DATA');
      widget.onAuthByGoogleSuccess(googleSignInAuthentication.accessToken ?? '',
          googleSignInAccount.email);
    } catch (error) {
      //AppLogger.e(error);
    }
  }

  void _authByAppleId() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    if (credential != null) {
      print('[apple sign in] Family name: ${credential.identityToken}');
      //AppLogger.d('[apple sign in] Family name: ${credential.familyName}');
      //AppLogger.d('[apple sign in] Given name: ${credential.givenName}');
      //AppLogger.d('identityToken: ${credential.identityToken}');
      widget.onAuthByAppleIdSuccess(
        credential.identityToken ?? '',
        credential.familyName ?? '',
        credential.givenName ?? '',
        credential.email ?? '',
      );
    } else {
      print("Sign in failed");
      //AppLogger.e("Sign in failed");
    }
  }
}
