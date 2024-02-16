import 'package:flutter/material.dart';
import 'package:kinopoisk_search/config/constants/app_colors.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

void showNoInternetToast(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    backgroundColor: AppColors.black,
    confirmBtnColor: Colors.redAccent,
    titleColor: AppColors.black,
    textColor: AppColors.black,
    title: 'Нет интернета',
      confirmBtnText: 'Ок'
  );
}