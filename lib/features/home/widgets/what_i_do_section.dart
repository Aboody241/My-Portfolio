import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatIDoSection extends StatefulWidget {
  const WhatIDoSection({super.key, this.onContactTap});

  final VoidCallback? onContactTap;

  @override
  State<WhatIDoSection> createState() => _WhatIDoSectionState();
}

class _WhatIDoSectionState extends State<WhatIDoSection> {
  int _hoveredIndex = 0; // First card is active by default

  static const List<_ServiceItemData> _services = [
    _ServiceItemData(
      title: 'Mobile App Development',
      description:
          'I build cross-platform mobile applications with Flutter and Dart, creating responsive and high-performance experiences for real-world products.',
      icon: Icons.phone_iphone_rounded,
      tags: ['Flutter', 'Dart', 'Responsive UI', 'Cross-Platform', 'Performance'],
    ),
    _ServiceItemData(
      title: 'App Architecture & Engineering',
      description:
          'I design applications with clean, scalable architecture and maintainable code, using structured state management and proven software engineering patterns.',
      icon: Icons.layers_rounded,
      tags: ['Clean Architecture', 'Bloc / Cubit', 'Repository Pattern', 'Dependency Injection'],
    ),
    _ServiceItemData(
      title: 'API & Backend Integration',
      description:
          'I connect mobile applications with reliable backend services and APIs, handling authentication, data flow, storage, and real-time application requirements.',
      icon: Icons.cloud_sync_rounded,
      tags: ['REST APIs', 'Firebase', 'Supabase', 'Authentication', 'Real-time Sync'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

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
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isDesktop ? 80.h : 48.h,
          ),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: _LeftContent(
                        onContactTap: widget.onContactTap,
                      ),
                    ),
                    SizedBox(width: 72.w),
                    Expanded(
                      flex: 6,
                      child: _buildCardsList(isDesktop: true),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LeftContent(
                      isCentered: false,
                      onContactTap: widget.onContactTap,
                    ),
                    SizedBox(height: 40.h),
                    _buildCardsList(isDesktop: false),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildCardsList({required bool isDesktop}) {
    return Column(
      children: List.generate(_services.length, (index) {
        final service = _services[index];
        final isLast = index == _services.length - 1;

        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : (isDesktop ? 20.h : 16.h)),
          child: _ServiceCard(
            service: service,
            isActive: _hoveredIndex == index,
            onHover: (isHovered) {
              setState(() {
                _hoveredIndex = isHovered ? index : 0;
              });
            },
          ),
        );
      }),
    );
  }
}

class _ServiceItemData {
  const _ServiceItemData({
    required this.title,
    required this.description,
    required this.icon,
    required this.tags,
  });

  final String title;
  final String description;
  final IconData icon;
  final List<String> tags;
}

class _LeftContent extends StatelessWidget {
  const _LeftContent({
    this.isCentered = false,
    this.onContactTap,
  });

  final bool isCentered;
  final VoidCallback? onContactTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Section Title
        Text(
          "What I Do?",
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.h2.copyWith(
            fontSize: isDesktop ? 38.sp : 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 20.h),

        // Paragraph 1
        Text(
          "I build modern, reliable mobile applications with a strong focus on performance, usability, and maintainable architecture. I turn ideas and requirements into polished mobile experiences using modern development practices and carefully structured code.",
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.body.copyWith(
            fontSize: isDesktop ? 15.sp : 14.sp,
            color: AppColors.textSecondary,
            height: 1.65,
          ),
        ),
        SizedBox(height: 16.h),

        // Paragraph 2
        Text(
          "From the initial concept to development and optimization, I focus on building applications that are scalable, responsive, and enjoyable to use.",
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.body.copyWith(
            fontSize: isDesktop ? 15.sp : 14.sp,
            color: AppColors.textSecondary,
            height: 1.65,
          ),
        ),
        SizedBox(height: 32.h),

        // CTA Button
        _LetsTalkButton(onTap: onContactTap),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.service,
    required this.isActive,
    required this.onHover,
  });

  final _ServiceItemData service;
  final bool isActive;
  final ValueChanged<bool> onHover;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        transform: isActive
            ? Matrix4.translationValues(0, -5.h, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: isActive
                  ? AppColors.primary.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: isActive ? 28.r : 16.r,
              offset: Offset(0, isActive ? 12.h : 6.h),
              spreadRadius: isActive ? 1 : 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              // Purple Accent Line on the Left
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  width: isActive ? 5.w : 0.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                    ),
                  ),
                ),
              ),

              // Card Content
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 32.w : 24.w,
                  vertical: isDesktop ? 26.h : 20.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon Badge
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 240),
                      curve: Curves.easeOutCubic,
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primary.withValues(alpha: 0.12)
                            : const Color(0xffF8F9FC),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isActive
                              ? AppColors.primary.withValues(alpha: 0.25)
                              : const Color(0xffECEEF2),
                          width: 1,
                        ),
                      ),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 240),
                        scale: isActive ? 1.08 : 1.0,
                        child: Icon(
                          service.icon,
                          size: isDesktop ? 26.r : 22.r,
                          color: isActive
                              ? AppColors.primary
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                    SizedBox(width: isDesktop ? 20.w : 16.w),

                    // Text & Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Card Title
                          Text(
                            service.title,
                            style: AppTextStyles.h3.copyWith(
                              fontSize: isDesktop ? 18.sp : 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 8.h),

                          // Description
                          Text(
                            service.description,
                            style: AppTextStyles.body.copyWith(
                              fontSize: isDesktop ? 14.sp : 13.sp,
                              color: AppColors.textSecondary,
                              height: 1.55,
                            ),
                          ),
                          SizedBox(height: 14.h),

                          // Focus Tags
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 6.h,
                            children: service.tags.map((tag) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? AppColors.primary.withValues(alpha: 0.06)
                                      : const Color(0xffF4F5F8),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  tag,
                                  style: TextStyle(
                                    fontFamily: 'Work Sans',
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isActive
                                        ? AppColors.primaryDark
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LetsTalkButton extends StatefulWidget {
  const _LetsTalkButton({this.onTap});

  final VoidCallback? onTap;

  @override
  State<_LetsTalkButton> createState() => _LetsTalkButtonState();
}

class _LetsTalkButtonState extends State<_LetsTalkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.03, 1.03))
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
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
                Text(
                  "Let's Talk",
                  style: AppTextStyles.button.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.white,
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(width: 8.w),
                AnimatedSlide(
                  offset: _isHovered ? const Offset(0.25, 0) : Offset.zero,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic,
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
