import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinopoisk_search/config/constants/app_colors.dart';
import 'package:kinopoisk_search/config/constants/app_text_styles.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/manager/movie_details_cubit.dart';

Padding movieParametersBox(int year, String votesImdb, int ageRating) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 98.w,
          height: 65.h,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.textColor2)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Год', style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor1)),
              Text('${year}', style: AppTextStyles.body14w4.copyWith(color: AppColors.textColor1, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        Container(
          width: 98.w,
          height: 65.h,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.textColor2)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Голоса', style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor1)),
              Text('${votesImdb}', style: AppTextStyles.body14w4.copyWith(color: AppColors.textColor1, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        Container(
          width: 98.w,
          height: 65.h,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.textColor2)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Возраст', style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor1)),
              Text('${ageRating}+', style: AppTextStyles.body14w4.copyWith(color: AppColors.textColor1, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ],
    ),
  );
}
