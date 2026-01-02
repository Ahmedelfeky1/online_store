import 'package:flutter/material.dart';
import 'package:online_shop/core/app_colors.dart';

class AppStyles {
  static TextStyle style24bold = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static TextStyle style20medium = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  static TextStyle style16 = const TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );
  static TextStyle style14 = const TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
  static TextStyle stylehint = const TextStyle(
    fontSize: 14,
    color: AppColors.textHint,
  );
  static TextStyle buttonText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle style24white = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle style14Error = const TextStyle(
    fontSize: 14,
    color: AppColors.error,
  );
}
