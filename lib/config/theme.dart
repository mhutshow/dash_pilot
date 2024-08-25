import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color scaffoldBackgroundColorDark = Color(0xFF0e0e0e);
const Color scaffoldBackgroundColorLight = Color(0xFFf9f9f9);
const Color darkModeSecondary  = Color(0xff1a1c1e);
const Color lightModeSecondary  = Colors.white;
const Color primaryColorDark = Color(0xff2f70c8);

ThemeData lightTheme(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  return ThemeData.light(useMaterial3: false).copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      secondary: lightModeSecondary,
    ),
    primaryColor: primaryColorDark,
    scaffoldBackgroundColor: scaffoldBackgroundColorLight,
  );
}

ThemeData darkTheme(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  return ThemeData.dark(useMaterial3: false).copyWith(
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: darkModeSecondary,
    ),
    primaryColor: primaryColorDark,
    scaffoldBackgroundColor: scaffoldBackgroundColorDark,
  );
}