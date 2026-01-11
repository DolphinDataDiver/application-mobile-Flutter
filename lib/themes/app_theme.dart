import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    background: AppColors.background,
  ),

  scaffoldBackgroundColor: AppColors.background,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    centerTitle: true,
  ),

  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(fontSize: 16),
  ),

  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),
);

