import 'package:flutter/material.dart';

class AppColors {
  // Prevent instantiation
  AppColors._();

  /// Brand colors
  static const Color primary = Color(0xFF7B1FA2);     // Blue
  static const Color secondary = Color(0xFF42A5F5);   // Light Blue

  /// Backgrounds
  static const Color background = Color(0xFFF4F6F8);
  static const Color surface = Colors.white;

  /// Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  /// Utility colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825);

  /// Chat-specific (optional, useful for your app)
  static const Color userBubble = Color(0xFFE3F2FD);
  static const Color botBubble = Color(0xFFFFFFFF);
}

