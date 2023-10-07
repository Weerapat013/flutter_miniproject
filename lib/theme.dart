import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';

ThemeData miniProjectTheme() {
  final ThemeData baseTheme = ThemeData(
    fontFamily: 'Mitr'
  );

  return baseTheme.copyWith(
    colorScheme: baseTheme.colorScheme.copyWith(
      primary: greenPrimary,
      onPrimary: onGreenPrimary,

      secondary: yellowSecondary,
      onSecondary: onYellowSecondary,

      error: alertPrimary,
      onError: onAlertPrimary,

      background: backgroundPrimary,
      onBackground: onbackgroundPrimary_2,
    ),

    textTheme: baseTheme.textTheme.copyWith(
       headlineLarge: baseTheme.textTheme.headlineLarge!.copyWith(
        fontFamily: 'Mitr-SemiBold',
        fontSize: 48,
      ),
      headlineMedium: baseTheme.textTheme.headlineLarge!.copyWith(
        fontFamily: 'Mitr-SemiBold',
        fontSize: 38,
      ),
      headlineSmall: baseTheme.textTheme.headlineLarge!.copyWith(
        fontFamily: 'Mitr-Medium',
        fontSize: 28,
      ),
      bodyLarge: baseTheme.textTheme.bodyLarge!.copyWith(
        fontFamily: 'Mitr-Medium',
        fontSize: 24,
      ),
      bodyMedium: baseTheme.textTheme.bodyLarge!.copyWith(
        fontFamily: 'Mitr-Medium',
        fontSize: 20,
      ),
      bodySmall: baseTheme.textTheme.bodyLarge!.copyWith(
        fontFamily: 'Mitr',
        fontSize: 16,
      ),
    ),
  );
}