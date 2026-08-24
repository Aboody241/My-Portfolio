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
            "Let's build something great.",
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
              "I'm always open to discussing mobile products, engineering opportunities, and interesting ideas.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                fontSize: 14.sp,
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.7),
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          const _LetsConnectButton(),
        ],
      ),
    );
  }
}

class _LetsConnectButton extends StatefulWidget {
  const _LetsConnectButton();

  @override
  State<_LetsConnectButton> createState() => _LetsConnectButtonState();
}

class _LetsConnectButtonState extends State<_LetsConnectButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Scroll to the contact section
          // This works by finding the ContactSection key in the parent
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: _isHovered
              ? Matrix4.translationValues(0, -2.h, 0)
              : Matrix4.identity(),
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.primaryDark : AppColors.primary,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 16.r,
                      offset: Offset(0, 6.h),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Let's Connect",
                style: AppTextStyles.button.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8.w),
              AnimatedSlide(
                offset: _isHovered ? const Offset(0.25, 0) : Offset.zero,
                duration: const Duration(milliseconds: 200),
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
    );
  }
}
