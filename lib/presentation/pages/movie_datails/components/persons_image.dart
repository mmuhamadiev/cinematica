import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinopoisk_search/config/constants/app_colors.dart';
import 'package:kinopoisk_search/config/constants/app_text_styles.dart';
import 'package:kinopoisk_search/data/models/movie_model.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/manager/movie_details_cubit.dart';

SingleChildScrollView persons_images(List<Persons> persons) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ...List.generate(persons.length, (index) {
          if(persons[index].photo == '') {
            return SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    width: 80.w,
                    child: Center(child: Text(persons[index].name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor1)))),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                    imageUrl: persons[index].photo,
                    placeholder: (context, url) => LinearProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.image),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    ),
  );
}
