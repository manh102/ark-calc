import 'package:flutter/material.dart';

class SoloerColors {
  static const Color primary = Color(0xff1E1E1E);
  static const Color primaryDark = Color(0xFF761818);
  static const Color primaryLight = Color(0xFFDC7E7E);
  static const Color onPrimary = Color(0xffffffff);
  static const Color primaryContainer = Color(0xffb0b2c0);
  static const Color onPrimaryContainer = Color(0xff0f0f10);
  static const Color secondary = Color(0xfffb8122);
  static const Color onSecondary = Color(0xff000000);
  static const Color secondaryContainer = Color(0xffffb680);
  static const Color onSecondaryContainer = Color(0xff140f0b);
  static const Color tertiary = Color(0xffea9654);
  static const Color onTertiary = Color(0xff000000);
  static const Color tertiaryContainer = Color(0xffe9cbab);
  static const Color onTertiaryContainer = Color(0xff13110e);
  static const Color error = Color(0xffb00020);
  static const Color onError = Color(0xffffffff);
  static const Color errorContainer = Color(0xfffcd8df);
  static const Color onErrorContainer = Color(0xff141213);
  static const Color background = Color(0xffFBFBFB);
  static const Color onBackground = Color(0xff090909);
  static const Color surface = Color(0xfff7f7f7);
  static const Color onSurface = Color(0xff090909);
  static const Color surfaceVariant = Color(0xffefefef);
  static const Color onSurfaceVariant = Color(0xff121212);
  static const Color outline = Color(0xff565656);
  static const Color shadow = Color(0xff000000);
  static const Color inverseSurface = Color(0xff111111);
  static const Color onInverseSurface = Color(0xffFFFFFF);
  static const Color inversePrimary = Color(0xff9ea2a6);
  static const Color surfaceTint = Color(0xff1d2228);

  static const Color indicator = Color(0xDD000000);
  static const Color divider = Color(0x1E090909);
  static const Color disabled = Color(0x317A1B1B);
  static const Color hover = Color(0x317A1B1B);
  static const Color focus = Color(0x4CD66868);
  static const Color highlight = Color(0x19D45D5D);
  static const Color splash = Color(0x33CC4242);
  static const Color hint = Color(0x99000000);

  static const Color primaryText = Color(0xFF292524);
  static const Color subText = Color(0xFF999999);

  static const Color socialBackground = Color(0xFFFAFAFA);

  static const Color copyCodeBorder = Color(0xFFAB87FF);

  static const Color buttonDisabledBackground = Color(0xFFCCCCCC);
  static const Color buttonDisabledText = SoloerColors.grey4;

  static const Color cardOverlayBackground = Color(0x991E1E1E);
  static const Color chipBackground = Color(0xFFEDEDED);

  static const Color membershipBackground = Color(0xFFE4E2FA);
  static const Color freebieBackground = Color(0xFFDAF0FF);

  static const Color normalStatusBarColor = background;
  static const Color transparentStatusBarColor = Color(0xFFE4E2FA);

  static const Color pinPutFill = Color(0xFFF7F7F7);
  static const Color pinPutBorder = Color(0xFF292524);
  static const Color pinPutError = Color.fromRGBO(255, 234, 238, 1);

  static const Color selectedTabColor = Color(0xFF8F85FF);
  static const Color unselectedTabColor = Color(0xFFCCCCCC);

  static const Color myPointCardColor = Color(0xfff7f7f7);

  static const Color grey4 = Color(0xFF666666);

  /// [MyPointWidget]-relative values
  static const Color progressThumb = Color(0xFFE4E2FA);
  static const Color progressIndicator = Color(0xFFAFA8FF);

  static const Color rewardPointBorder = Color(0xFFFF9900);
  static const Color bigRewardPointBorder = Color(0xFFAFA8FF);

  static const Color favoriteButtonBorder = Color(0xFFB3B3B3);

  static const Color selectedChipColor = Color(0xFFE4E2FA);
  static const Color unselectedChipBorderColor = Color(0xFFCCCCCC);

  static const Color primaryIndicator = Color(0xFFAFA8FF);
  static const Color primaryDivider = Color(0xFFCCCCCC);

  static const Color barrierColor = Color(0x99292524);

  static const Color checkboxColor = Color(0xFFAFA8FF);
  static const Color checkboxIndicator = Colors.white;

  static const Decoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: [0.0643, 0.6361, 0.9948],
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFDAF0FF),
        Color(0xFFE4E2FA),
      ],
    ),
  );

  static const Decoration soloerBackground = BoxDecoration(
    color: SoloerColors.background,
  );

  /*
    [TutorialCard] gradient list
   */
  static const Gradient tutorialGradientBgStep1 = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFDAF0FF),
      Color(0xFFE4E2FA),
    ],
    stops: [0.0, 0.5388, 0.8766],
  );

  static const Gradient tutorialGradientBgStep2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFE9EC),
      Color(0xFFEFFFF4),
      Color(0xFFE4E2FA),
    ],
    stops: [0.0, 0.5388, 0.8766],
  );

  static const Gradient tutorialGradientBgStep3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFAFAE2),
      Color(0xFFFFFEDA),
      Color(0xFFFFE9EC),
    ],
    stops: [0.0, 0.5388, 0.8766],
  );

  static const ColorScheme colorSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface,
    surfaceVariant: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    shadow: shadow,
    inverseSurface: inverseSurface,
    onInverseSurface: onInverseSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );

  // Soloer
  // Line color
  static const Color lineColor = const Color(0xFFE5E5E5);
  // Link
  static const Color linkColor = const Color(0xFF3296fa);
  // Background color
  static const Color backgroundColor = const Color(0xFFF5F5F5);
  static const Color myPageBackgroundColor = const Color(0xFF006191);
  static const Color iconGrayColor = const Color(0xFF888888);
  static const Color profileBackgroundColor = const Color(0xFFD2FF96);

  // Button color
  static const Color disabledBgColor = const Color(0xFFE6E6E6);
  static const Color disabledTextColor = const Color(0xFFB2B2B2);
  static const Color minorTextColor = const Color(0xFF999999);
  static const Color color_dfdfdf = const Color(0xFFDFDFDF);
  static const Color color_333333 = const Color(0xFF333333);
  static const Color color_eeeeee = const Color(0xFFEEEEEE);
  static const Color color_949494 = const Color(0xFF949494);
  static const Color color_FF6A00 = const Color(0xFFFF6A00);
  static const Color color_C1C1C1 = const Color(0xFFC1C1C1);
  static const Color color_CCCCCC = const Color(0xFFCCCCCC);
  static const Color color_282828 = const Color(0xFF282828);
  static const Color color_08B16B = const Color(0xFF08B16B);
  static const Color color_C5C5C5 = const Color(0xFFC5C5C5);
  static const Color color_F1F1F1 = const Color(0xFFF1F1F1);
  static const Color color_F7F7F7 = const Color(0xFFF7F7F7);
  static const Color color_363636 = const Color(0xFF363636);
  static const Color color_F4F4F4 = const Color(0xFFF4F4F4);
  static const Color color_E6F9F3 = const Color(0xFFE6F9F3);
  static const Color color_2196F3 = const Color(0xFF2196F3);
  static const Color color_F8F8F8 = const Color(0xFFF8F8F8);
  static const Color color_666666 = const Color(0xFF666666);
  static const Color color_989898 = const Color(0xFF989898);
  static const Color color_86674E = const Color(0xFF86674E);
  static const Color color_0FC188 = const Color(0xFF0FC188);
  static const Color color_4674ec = const Color(0xFF4674ec);
  static const Color color_d5d5d5 = const Color(0xFFd5d5d5);
  static const Color color_0e67ed = const Color(0xFF0e67ed);
  static const Color color_ebf0f6 = const Color(0xFFebf0f6);
  static const Color color_e41010 = const Color(0xFFe41010);
  static const Color color_888888 = const Color(0xFF888888);
  static const Color color_0ebe2c = const Color(0xFF0ebe2c);

  static const Color color_727272 = const Color(0xFF727272);
  static const Color color_f7f7f7 = const Color(0xFFf7f7f7);
  static const Color color_289f74 = const Color(0xFF289f74);
  static const Color color_ababab = const Color(0xFFababab);
  static const Color color_dadada = const Color(0xFFdadada);
  static const Color color_3a6ea5 = const Color(0xFF3a6ea5);
  static const Color color_f6f6f6 = const Color(0xFFf6f6f6);

  static const Color color_f53414 = const Color(0xFFf53414);
  static const Color color_b22008 = const Color(0xFFb22008);
  static const Color color_b83107 = const Color(0xFFb83107);

  // Soloer Color
  static const Color darkPastelGreen = const Color(0xFF0EBE2C);
  static const Color darkJungleGreen = const Color(0xFF0D1B1E);
  static const Color airSuperiorityBlue = const Color(0xFF7798AB);
  static const Color dutchWhite = const Color(0xFFE8DCB9);
  static const Color pinkLace = const Color(0xFFF2CEE6);
  static const Color color_1e1e38 = const Color(0xFF1e1e38);
  static const Color color_0c1b1e = const Color(0xFF0c1b1e);
  static const Color color_919191 = const Color(0xFF919191);
  static const Color color_3d5cfa = const Color(0xFF3d5cfa);
  static const Color color_ededed = const Color(0xFFededed);
  static const Color color_9b9d9d = const Color(0xFF9b9d9d);
  static const Color color_ff0b0b = const Color(0xFFff0b0b);
  static const Color color_e8dcB9 = const Color(0xFFE8DCB9);
  static const Color color_848496 = const Color(0xFF848496);
  static const Color color_b7f0ad = const Color(0xFFB7F0AD);

  static const Color color_b80707 = const Color(0xFFb80707);

  static const Color color_555555 = const Color(0xFF555555);

  static const Color color_0f875c = const Color(0xFF0f875c);

  static const Color color_074d34 = const Color(0xFF074d34);

  static const Color text_red = Color(0xFFFF5658);

  static const Color text_blue = Color(0xFF558CDD);
  static const Color text_light_blue = Color(0xFF51B3F6);

  static const Color text_orange = Color(0xFFFD7934);
  static const Color text_light_orange = Color(0xFFFFC645);

  static const Color text_black = Color(0xFF333333);
  static const Color text_middle_black = Color(0xFF5C5C5C);
  static const Color text_light_black = Color(0xFF666666);

  static const Color text_grey = Color(0xFF999999);
  static const Color text_light_grey = Color(0xFFCCCCCC);

  static const Color color_ededf6 = const Color(0xFFEDEDF6);
  static const Color color_de = const Color(0xFFDEDEDE);
  static const Color color_F20C0C = const Color(0xFFF20C0C);
  static const Color color_ea3c2d = const Color(0xFFEA3C2D);
  static const Color color_FDF6E1 = const Color(0xFFFDF6E1);
  static const Color color_ED983F = const Color(0xFFED983F);
  static const Color color_EFEFEF = const Color(0xFFEFEFEF);
  static const Color color_FFFFFF = const Color(0xFFFFFFFF);
  static const Color color_FE5C5C = const Color(0xFFFE5C5C);
  static const Color color_F53317 = const Color(0xFFF53317);
  static const Color color_F9DB8F = const Color(0xFFF9DB8F);
  static const Color color_gradient_86674E_4 = const Color(0x6686674E);
  static const Color color_gradient_86674E_6 = const Color(0x9986674E);
  static const Color color_black_4 = const Color.fromRGBO(00, 00, 00, 0.4);
  static const Color color_black_7 = const Color.fromRGBO(00, 00, 00, 0.7);
  static const Color color_white_4 = const Color.fromRGBO(255, 255, 255, 0.4);
  static const Color color_white = const Color(0xFFFFFFFF);
  static const Color color_trans = const Color(0x00000000);
  static const Color color_f8f8f8 = const Color(0xFFF8F8F8);
  static const Color color_C4C4C4 = const Color(0xFFC4C4C4);
  static const Color color_ffa42c = const Color(0xFFffa42c);
  static const Color color_E3FC31 = const Color(0xFFE3FC31);
  static const Color color_00E927 = const Color(0xFF00E927);
  static const Color color_3207E6 = const Color(0xFF3207E6);
  static const Color color_94 = const Color(0xFF949494);
  static const Color color_66 = const Color(0xFF666666);
  static const Color color_59 = const Color(0xFF595959);
  static const Color color_d5 = const Color(0xFFd5d5d5);
  static const Color color_70 = const Color(0xFF707070);
  static const Color color_e3e3e3 = const Color(0xFFe3e3e3);
  static const Color color_f0f0f0 = const Color(0xFFF0F0F0);
  static const Color color_5c6668 = const Color(0xFF5C6668);
  // ViewColors
  static const Color drawer_bg = Color(0xFF1c4f84);
  static const Color drawer_border = Color(0xFF49729d);
  static const Color grey = Color(0xFFDCDCDC);
  static const Color middle_grey = Color(0xFFEEEEEE);
  static const Color light_grey = Color(0xFFF5F5F5);

  static const Color orange_bg = Color(0xFFFFA700);
  static const Color middle_orange_bg = Color(0xFFFFBF26);
  static const Color light_orange_bg = Color(0xFFFDF6E1);

  static const Color blue_bg = Color(0xFF2C9EEC);
  static const Color middle_blue_bg = Color(0xFF35A9F5);
  static const Color light_blue_bg = Color(0xFFE1ECFB);

  static const Color red_bg = Color(0xFFFF3B30);
  static const Color middle_red_bg = Color(0xFFF26279);

  static const Color green_bg = Color(0xFF5CBF04);
  static const Color middle_green_bg = Color(0xFF72D947);

  static const Color primary_bg_25 = Color(0x40FFBF26);
}
