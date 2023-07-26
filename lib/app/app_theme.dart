import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/app_colors.dart';

class AppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
        primaryColor: AppColors.colorPrimaryDark,
        appBarTheme: appBarTheme(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'nunito',
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 24,
                fontFamily: 'nunito'),
            displayMedium: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 20,
                fontFamily: 'nunito'),
            displaySmall: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'nunito'),
            bodyLarge: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 16,
                fontFamily: 'nunito'),
            bodyMedium: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 14,
                fontFamily: 'nunito'),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorPrimary)
            .copyWith(secondary: AppColors.colorAccent),
        navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.colorPrimaryDark,
            );
          } else {
            return Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black87,
            );
          }
        })),
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }

  static AppBarTheme appBarTheme() {
    return AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: textStyle(),
        toolbarTextStyle: textStyle(),
        systemOverlayStyle: SystemUiOverlayStyle.dark);
  }

  static TextStyle textStyle() {
    return const TextStyle(
        color: AppColors.primaryTextColor, fontSize: 14, fontFamily: 'Sora');
  }
}
