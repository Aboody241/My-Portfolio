import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.title.copyWith(
          color: AppColors.textPrimary,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
        children: const [
          TextSpan(text: 'Abdullah'),
          TextSpan(
            text: '.',
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
