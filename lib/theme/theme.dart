import 'package:flutter/material.dart';

import 'package:apprise/theme/colors.dart';

// ThemeData get appriseTheme => _buildAppriseTheme();

CustomTheme customTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  // static ThemeData get lightTheme {
  //   final ThemeData base = ThemeData.light();
  //   return base.copyWith(colorScheme: lightColorScheme);
  // }

  static ThemeData get lightTheme =>
      themeData(lightColorScheme, lightFillColor);

  static ThemeData get darkTheme => themeData(darkColorScheme, darkFillColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    // final ThemeData base = ThemeData.light();
    // final ThemeData base = ThemeData.dark();

    // temporary theme
    return ThemeData(
      colorScheme: colorScheme,

      appBarTheme: AppBarTheme(
        // textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        actionsIconTheme: IconThemeData(color: whiteColor),
        backgroundColor: colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.secondary),
        // brightness: colorScheme.brightness,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: _isDarkTheme ? colorScheme.secondary : whiteColor,
        indicator: ShapeDecoration(
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
                color: _isDarkTheme
                    ? colorScheme.secondary
                    : colorScheme.onSecondary,
                width: 3.0,
                style: BorderStyle.solid),
          ),
        ),
      ),
      scaffoldBackgroundColor: colorScheme.background,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: _isDarkTheme ? colorScheme.primary : whiteColor),

      // textTheme: _textTheme,
      // // Matches manifest.json colors and background color.
      // primaryColor: const Color(0xFF030303),

      // iconTheme: IconThemeData(color: colorScheme.onPrimary),
      // canvasColor: colorScheme.background,

      // highlightColor: Colors.transparent,
      // focusColor: focusColor,
      // snackBarTheme: SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Color.alphaBlend(
      //     lightFillColor.withOpacity(0.80),
      //     darkFillColor,
      //   ),
      //   contentTextStyle: _textTheme.subtitle1.apply(color: darkFillColor),
      // ),
    );
  }

  static ColorScheme lightColorScheme = ColorScheme(
    primary: appriseLightPrimary,
    // primaryVariant: appriseLightPrimaryVariant,
    onPrimary: appriseLightOnPrimary,
    secondary: appriseLightSecondary,
    // secondaryVariant: appriseLightSecondaryVariant,
    onSecondary: appriseLightOnSecondary,
    background: appriseLightBackground,
    onBackground: appriseLightOnBackground,
    surface: appriseLightSurface,
    onSurface: appriseLightOnSurface,
    error: appriseLightError,
    onError: lightFillColor,
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = ColorScheme(
    primary: appriseDarkPrimary,
    // primaryVariant: appriseDarkPrimaryVariant,
    onPrimary: appriseDarkOnPrimary,
    secondary: appriseDarkSecondary,
    // secondaryVariant: appriseDarkSecondaryVariant,
    onSecondary: appriseDarkOnSecondary,
    background: appriseDarkBackground,
    onBackground: appriseDarkOnBackground,
    surface: appriseDarkSurface,
    onSurface: appriseDarkOnSurface,
    onError: darkFillColor,
    error: appriseDarkError,
    brightness: Brightness.dark,
  );

  // static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  // static const _bold = FontWeight.w700;

  //  static final TextTheme _textTheme = TextTheme(
  //   headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
  //   caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
  //   headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
  //   subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
  //   overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
  //   bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
  //   subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
  //   bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
  //   headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
  //   button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  // );

  set setDarkTheme(bool isDarkTheme) {
    _isDarkTheme = isDarkTheme;
    notifyListeners();
  }

  String get themeToString => _isDarkTheme ? 'Dark theme' : 'Light theme';
  bool get isDartTheme => _isDarkTheme ? true : false;
}
