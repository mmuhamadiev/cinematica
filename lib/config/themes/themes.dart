import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

abstract class Themes {
  const Themes._();
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.accentColor,
      colorScheme: ColorScheme.light(
        secondary: AppColors.primaryLight.shade100,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.baseLight.shade100,
        centerTitle: true,
        titleTextStyle: AppTextStyles.body16w4,
        iconTheme: IconThemeData(
          color: AppColors.textColor.shade1,
        ),
      ),
      primaryColor: AppColors.primaryLight,
      fontFamily: 'Inter',
      dividerColor: Colors.transparent,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryLight.shade100,
            ),
          ),
        ),
        labelPadding: const EdgeInsets.all(12.0),
        labelColor: AppColors.primaryLight.shade100,
        labelStyle: AppTextStyles.body16w4,
        unselectedLabelColor: AppColors.textColor.shade2,
        unselectedLabelStyle: AppTextStyles.body16w4,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: ColorScheme.light(
        secondary: AppColors.primaryLight.shade100,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.baseLight.shade100,
        centerTitle: true,
        titleTextStyle: AppTextStyles.body16w4,
        iconTheme: IconThemeData(
          color: AppColors.textColor3,
        ),
      ),
      primaryColor: AppColors.primaryLight,
      fontFamily: 'Inter',
      dividerColor: Colors.transparent,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryLight.shade100,
            ),
          ),
        ),
        labelPadding: const EdgeInsets.all(12.0),
        labelColor: AppColors.primaryLight.shade100,
        labelStyle: AppTextStyles.body16w4,
        unselectedLabelColor: AppColors.textColor3,
        unselectedLabelStyle: AppTextStyles.body16w4,
      ),
    );
  }
}
