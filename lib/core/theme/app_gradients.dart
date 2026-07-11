import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';


abstract final class AppGradients {
  AppGradients._();

  static const hero = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffF5E8FF),
      Color(0xffFFFFFF),
      Color(0xffE9FCFA),
    ],
  );

  static const primary = LinearGradient(
    colors: [
      AppColors.primary,
      AppColors.primaryDark,
    ],
  );
}