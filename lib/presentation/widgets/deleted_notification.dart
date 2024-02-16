import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinopoisk_search/config/constants/app_colors.dart';
import 'package:kinopoisk_search/config/constants/app_text_styles.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showTopNotFilledToast(BuildContext context) {
  return showTopSnackBar(
      Overlay.of(context),
      Center(
        child: Container(
          width: 430.w * 0.8,
          height: 54.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38.r),
            color: AppColors.topSnackbarColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.abc, color: AppColors.accentColor,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Material(
                    color: Colors.transparent,
                    child: Text('Фильм удален!', style: AppTextStyles.body14w4.copyWith(color: AppColors.textColor1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      animationDuration: const Duration(milliseconds: 1000),
      displayDuration: const Duration(milliseconds: 800));
}