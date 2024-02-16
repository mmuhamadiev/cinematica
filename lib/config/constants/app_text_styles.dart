import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String fontFamily = 'Inter';

  static TextStyle head48w5 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 48.sp,
      color: AppColors.textColor.shade1);
  static TextStyle head32w4 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 32.sp,
      color: AppColors.textColor.shade1);
  static TextStyle head24w5 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 24.sp,
      color: AppColors.textColor.shade1);
  static TextStyle head20w5 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 20.sp,
      color: AppColors.textColor.shade1);
  static TextStyle body16w4 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16.sp,
      color: AppColors.textColor.shade1);
  static TextStyle body14w4 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14.sp,
      color: AppColors.textColor.shade1);
  static TextStyle body10w4 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 10.sp,
      color: AppColors.textColor.shade1);
  static TextStyle body16w5 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 16.sp,
      color: AppColors.textColor.shade1);
  static TextStyle body16w7 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 16.sp,
      color: AppColors.textColor.shade1);

  static TextStyle body12w4 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12.sp,
      color: AppColors.textColor.shade1);

  static TextStyle button16w5 = TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 16.sp,
      color: AppColors.textColor.shade1);
}
