import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    this.onViewProjectsTap,
    this.onDownloadCvTap,
  });

  final VoidCallback? onViewProjectsTap;
  final VoidCallback? onDownloadCvTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final isTablet = width >= 768 && width < 1024;

    final horizontalPadding = isDesktop
        ? 100.w
        : isTablet
            ? 48.w
            : 24.w;

    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isDesktop ? 80.h : 40.h,
          ),
          child: isDesktop
              ? _DesktopHero(
                  onViewProjectsTap: onViewProjectsTap,
                  onDownloadCvTap: onDownloadCvTap,
                )
              : _MobileHero(
                  onViewProjectsTap: onViewProjectsTap,
                  onDownloadCvTap: onDownloadCvTap,
                ),
        ),
      ),
    );
  }
}

class _DesktopHero extends StatelessWidget {
  const _DesktopHero({
    this.onViewProjectsTap,
    this.onDownloadCvTap,
  });

  final VoidCallback? onViewProjectsTap;
  final VoidCallback? onDownloadCvTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _HeroContent(
                onViewProjectsTap: onViewProjectsTap,
                onDownloadCvTap: onDownloadCvTap,
              ),
            ],
          ),
        ),
        SizedBox(width: 48.w),
        const Expanded(
          flex: 5,
          child: Center(
            child: _HeroAvatar(),
          ),
        ),
      ],
    );
  }
}

class _MobileHero extends StatelessWidget {
  const _MobileHero({
    this.onViewProjectsTap,
    this.onDownloadCvTap,
  });

  final VoidCallback? onViewProjectsTap;
  final VoidCallback? onDownloadCvTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const _HeroAvatar(),
        SizedBox(height: 36.h),
        _HeroContent(
          isCentered: true,
          onViewProjectsTap: onViewProjectsTap,
          onDownloadCvTap: onDownloadCvTap,
        ),
      ],
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({
    this.isCentered = false,
    this.onViewProjectsTap,
    this.onDownloadCvTap,
  });

  final bool isCentered;
  final VoidCallback? onViewProjectsTap;
  final VoidCallback? onDownloadCvTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;

    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Greeting
        Text(
          "Hello, I'm",
          style: AppTextStyles.h1.copyWith(
            fontSize: isCentered ? 30.sp : 48.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.15,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 4.h),

        // Name (Strongest element)
        Text(
          "Abdullah Essam",
          style: AppTextStyles.h1.copyWith(
            fontSize: isCentered ? 36.sp : 56.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            height: 1.2,
            letterSpacing: -1.0,
          ),
        ),
        SizedBox(height: 20.h),

        // Professional Description
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isCentered ? 8.w : 0),
          child: Column(
            crossAxisAlignment: isCentered
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: isCentered ? TextAlign.center : TextAlign.start,
                text: TextSpan(
                  style: AppTextStyles.body.copyWith(
                    fontSize: isDesktop ? 16.sp : 14.sp,
                    color: AppColors.textSecondary,
                    height: 1.65,
                  ),
                  children: [
                    const TextSpan(text: "I'm a "),
                    TextSpan(
                      text: "Mobile App Engineer",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: " specializing in "),
                    TextSpan(
                      text: "Flutter",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Dart",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ", focused on building reliable, scalable, and user-friendly mobile applications.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "I focus on clean architecture, maintainable code, smooth user experiences, and building mobile products that solve real-world problems.",
                textAlign: isCentered ? TextAlign.center : TextAlign.start,
                style: AppTextStyles.body.copyWith(
                  fontSize: isDesktop ? 15.sp : 13.5.sp,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),

        // CTA Buttons: [ Download CV ] [ View Projects → ]
        Wrap(
          spacing: 16.w,
          runSpacing: 12.h,
          alignment: isCentered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _DownloadCvButton(onTap: onDownloadCvTap),
            _ViewProjectsButton(onTap: onViewProjectsTap),
          ],
        ),
      ],
    );
  }
}

class _DownloadCvButton extends StatefulWidget {
  const _DownloadCvButton({this.onTap});

  final VoidCallback? onTap;

  @override
  State<_DownloadCvButton> createState() => _DownloadCvButtonState();
}

class _DownloadCvButtonState extends State<_DownloadCvButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: _isHovered ? AppColors.primaryDark : AppColors.primary,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: _isHovered ? 0.35 : 0.2),
                  blurRadius: _isHovered ? 16.r : 10.r,
                  offset: Offset(0, _isHovered ? 6.h : 3.h),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.file_download_outlined,
                  color: Colors.white,
                  size: 18.r,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Download CV',
                  style: AppTextStyles.button.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.white,
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

class _ViewProjectsButton extends StatefulWidget {
  const _ViewProjectsButton({this.onTap});

  final VoidCallback? onTap;

  @override
  State<_ViewProjectsButton> createState() => _ViewProjectsButtonState();
}

class _ViewProjectsButtonState extends State<_ViewProjectsButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.08)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: _isHovered
                    ? AppColors.primary
                    : AppColors.border,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: _isHovered ? 0.06 : 0.02),
                  blurRadius: _isHovered ? 14.r : 6.r,
                  offset: Offset(0, _isHovered ? 4.h : 2.h),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View Projects',
                  style: AppTextStyles.button.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: _isHovered ? AppColors.primary : AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 8.w),
                AnimatedSlide(
                  offset: _isHovered ? const Offset(0.25, 0) : Offset.zero,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic,
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: _isHovered ? AppColors.primary : AppColors.textPrimary,
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

class _HeroAvatar extends StatefulWidget {
  const _HeroAvatar();

  @override
  State<_HeroAvatar> createState() => _HeroAvatarState();
}

class _HeroAvatarState extends State<_HeroAvatar> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final cardSize = isDesktop ? 500.r : (width >= 600 ? 380.r : 280.r);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        width: cardSize,
        height: cardSize,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: _isHovered ? 36.r : 24.r,
              offset: Offset(0, _isHovered ? 16.h : 10.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Subtle background pastel gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xffFAF5FF),
                      Colors.white,
                      const Color(0xffF0FDF4).withValues(alpha: 0.4),
                    ],
                  ),
                ),
              ),

              // Profile Image
              AnimatedScale(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                scale: _isHovered ? 1.02 : 1.0,
                child: Image.asset(
                  'assets/images/image2.png',
                  width: cardSize,
                  height: cardSize,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.2),
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.person_rounded,
                        size: 80.r,
                        color: AppColors.textLight,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
