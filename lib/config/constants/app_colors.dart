import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const Color black = Color(0xFF000000);
  static const Color primaryBlack = Color(0xFF0B121C);
  static const Color greyScaffold = Color(0xFFEDF0EE);
  static const Color accentColor = Colors.white;
  static Color navBarHover = const Color(0x0fffffff).withOpacity(0.8);
  static Color productBuyIcon = const Color(0xff131313);
  static const Color lightGreenLogo = Color(0xFF6AD9AC);
  static const Color brown = Color(0xFFDC7400);
  static const Color switcherLightTheme = Color(0xFFB3B8EA);
  static const Color dateTimePickerBg = Color(0xFFE0E1F5);
  static const Color dateTimePickerDarkBg = Color(0xFF014A63);
  static const Color darkGradient = Color(0xFF000B29);
  static const Color dark2Gradient = Color(0xFF01647A);
  static const Color gradientPurple = Color(0xFF7E3AC8);
  static const Color avatarPurple = Color(0xFFB28ADF);
  static const Color gradientPurple2 = Color(0xFFB997DF);
  static const Color lightGradient3 = Color(0xFFCFD1ED);
  static const Color darkBlue = Color(0xFF003248);
  static const Color darkGrey = Color(0xFF80838C);

  static const Color topSnackbarColor = Color(0xFF2E323E);
  static const Color ratingColor = Color(0xFFFFBB00);

  static Color notificationsDarkBg = const Color(0xFF025E72).withOpacity(0.6);
  static Color chatIconPopup = const Color(0xFF206F83);
  static Color chatBottomSheetFilterColor = const Color(0xFF295567);

  
  static const Color textColor1 = Color(0xFFFFFFFF);
  static Color textColor2 = const Color(0xffffffff).withOpacity(0.56);
  static Color textColor3 = const Color(0xFF000718).withOpacity(0.5);
  static Color textColor4 = const Color(0xff000000);

  static Color navBarDark = const Color(0xff000410);

  static Color gateCounterColor = const Color(0xFF000718).withOpacity(0.12);
  static Color hoverColor = const Color(0xFF000718).withOpacity(0.5);
  static Color discoveryIndicatorColor = const Color(0xFF000718).withOpacity(0.6);
  static Color inactiveColor = const Color(0xFF000718).withOpacity(0.2);
  static Color inactiveColor32 = const Color(0xFF000718).withOpacity(0.32);
  static Color inactiveNavBarColor = const Color(0x0fffffff).withOpacity(0.32);

  static Color lobbyPopupAvatarBg = const Color(0xffC3E8F3);

  static const Color mainYellow = Color(0xFFFFFF99);
  static const Color mainLightBlue = Color(0xff00FFFF);

  static const Color yellowDark = Color(0xFFEEC68A);
  static const Color yellowLobbySwipeCard = Color(0xFFCABF8C);
  static const Color yellowLobbySwipeCardDark = Color(0xFFD8D0AB);
  static const Color darkOrangeLobbySwipeCard = Color(0xFFDEC6AA);
  static const Color yellowChip = Color(0xFFFFF4D4);
  static const Color notificationAvatarBg = Color(0xFFC3E8F3);


  static const Color hintContainer = Color(0xffFCEFF6);
  static const Color hintContainerBorder = Color(0xffEF5DA8);

  static Color whiteTransparent12 = const Color(0x0fffffff).withOpacity(0.12);
  static Color whiteTransparent08 = const Color(0x0fffffff).withOpacity(0.08);
  static Color whiteTransparent50 = const Color(0x0fffffff).withOpacity(0.5);
  static Color whiteTransparent24 = const Color(0x0fffffff).withOpacity(0.24);
  static Color whiteTransparent32 = const Color(0x0fffffff).withOpacity(0.32);

  static const Color greenAcceptBtnColor = Color(0xff2FD27F);
  static const Color redCancelBtnColor = Color(0xffEC5757);

  static const Color gateFullColor = Color(0xffFF3A3A);
  static const Color errorColor = Color(0xffFF166A);
  static const Color toggleGreen = Color(0xff2FCA7B);

  static const Color chatOnlineIndicatorDarkColor = Color(0xff15475f);
  static const Color chatOnlineIndicatorColor = Color(0xff4EFFBF);
  static const Color chatsubtitlecolor = Color.fromRGBO(0, 7, 24, 0.50);
  static const Color chatsortbackcolor = Color.fromRGBO(0, 7, 24, 0.08);
  static const Color chatNotificationBadgeColor = Color(0xffFF5A50);
  static const Color chatcircleBarry = Color(0xffACC676);
  static const Color chatcircleAnnie = Color(0xffB17F65);
  static const Color chatcircleChristy = Color(0xffB28ADF);
  static const Color chatcircleGarry = Color(0xffB7946B);
  static  Color chatonlinetextcolor = const Color(0xff000718).withOpacity(0.5);

  static getPrimaryColor(int num) => Color(int.parse('0x${num}00845A'));

  static PrimaryColor primaryLight = const PrimaryColor(
    0xFF00845A,
    <int, Color>{
      100: Color(0xFF00845A),
      50: Color(0xFFF2FDF5),
    },
  );

  static BaseColor baseLight = BaseColor(
    0xFF16A249,
    <int, Color>{
      100: Colors.white,
      50: const Color(0xFFF4F4F4),
      80: Colors.white.withOpacity(.8),
      40: Colors.white.withOpacity(.4),
      20: Colors.white.withOpacity(.2),
      60: Colors.white.withOpacity(.6),
    },
  );

  static TextColor textColor = TextColor();
}

class BaseColor extends ColorSwatch<int> {
  const BaseColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;

  Color get shade40 => this[40]!;

  Color get shade80 => this[80]!;

  Color get shade20 => this[20]!;

  Color get shade60 => this[60]!;
}

class PrimaryColor extends ColorSwatch<int> {
  const PrimaryColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;
}

class TextColor extends ColorSwatch<int> {
  TextColor()
      : super(
          0xFF332f2e,
          <int, Color>{
            1: const Color(0xFF000000),
            2: const Color(0xFF000000),
            3: const Color(0xFF000000),
            4: const Color(0xFF000000),
            5: const Color(0x0fffffff).withOpacity(0.56),
            6: const Color(0xFF000000),
          },
        );

  Color get shade1 => this[1]!;
  Color get shade2 => this[2]!;
  Color get shade3 => this[3]!;
  Color get shade4 => this[4]!;
  Color get shade5 => this[5]!;
  Color get shade6 => this[6]!;
}