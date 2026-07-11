import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCtaSection extends StatelessWidget {
  const ProjectCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return Container(
      width: double.infinity,
      color: AppColors.secondary,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: isDesktop ? 80.h : 48.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Do you have Project Idia?\nLet's discuss your project!",
            textAlign: TextAlign.center,
            style: AppTextStyles.h2.copyWith(
              fontSize: isDesktop ? 36.sp : 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            constraints: BoxConstraints(maxWidth: 600.w),
            child: Text(
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                fontSize: 14.sp,
                color: Colors.white.withOpacity(0.7),
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          const _LetWorkTogetherButton(),
        ],
      ),
    );
  }
}

class _LetWorkTogetherButton extends StatefulWidget {
  const _LetWorkTogetherButton();

  @override
  State<_LetWorkTogetherButton> createState() => _LetWorkTogetherButtonState();
}

class _LetWorkTogetherButtonState extends State<_LetWorkTogetherButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: _isHovered ? AppColors.primaryDark : AppColors.primary,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 12.r,
                        offset: Offset(0, 6.h),
                      )
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Let's work Together",
                  style: AppTextStyles.button.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                AnimatedSlide(
                  offset: _isHovered ? const Offset(0.25, 0) : Offset.zero,
                  duration: const Duration(milliseconds: 150),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 18.r,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
