import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppDecorations {

  static BoxDecoration boxDecor(double radius)
  {
    return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    // color: AppColors.textColor.shade2,
  );
  }

  static ButtonStyle buttonStyle(
      {double? borderRadius,
      Color? bgColor,
      EdgeInsets? padding,
      BorderSide? border,
      Size? size,
      Color? overlayColor}) {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          side: border ?? BorderSide.none,
        ),
      ),
      fixedSize: MaterialStatePropertyAll(size),
      backgroundColor: MaterialStateProperty.all(bgColor ?? AppColors.mainYellow),
      overlayColor: MaterialStateProperty.all(overlayColor ?? AppColors.mainYellow.withOpacity(0.5)),
      padding: MaterialStateProperty.all(padding),
    );
  }
}
