import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle labelBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
    height: 1.35,
  );

  static const TextStyle buttonOutlined = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle buttonFilled = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
