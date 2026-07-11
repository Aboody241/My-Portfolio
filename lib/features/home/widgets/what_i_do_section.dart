import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatIDoSection extends StatefulWidget {
  const WhatIDoSection({super.key});

  @override
  State<WhatIDoSection> createState() => _WhatIDoSectionState();
}

class _WhatIDoSectionState extends State<WhatIDoSection> {
  int _hoveredIndex = 0; // 0 means the first card (UX) is active by default

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    final services = [
      const _ServiceData(
        title: 'User Experience (UX)',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla purus arcu, varius eget velit non, laoreet imperdiet orci. Mauris ultrices eget lorem ac vestibulum.',
      ),
      const _ServiceData(
        title: 'User Interface (UI)',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla purus arcu, varius eget velit non, laoreet imperdiet orci. Mauris ultrices eget lorem ac vestibulum.',
      ),
      const _ServiceData(
        title: 'Web Development',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla purus arcu, varius eget velit non, laoreet imperdiet orci. Mauris ultrices eget lorem ac vestibulum.',
      ),
    ];

    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 100.w : 24.w,
            vertical: isDesktop ? 80.h : 40.h,
          ),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: const _LeftContent(),
                    ),
                    SizedBox(width: 80.w),
                    Expanded(
                      flex: 6,
                      child: _buildCardsList(services),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _LeftContent(isCentered: true),
                    SizedBox(height: 48.h),
                    _buildCardsList(services),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildCardsList(List<_ServiceData> services) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return Column(
      children: List.generate(services.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == services.length - 1 ? 0 : (isDesktop ? 24.h : 16.h)),
          child: _ServiceCard(
            title: services[index].title,
            description: services[index].description,
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

class _ServiceData {
  const _ServiceData({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class _LeftContent extends StatelessWidget {
  const _LeftContent({this.isCentered = false});

  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "What I do?",
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.h2.copyWith(
            fontSize: isDesktop ? 38.sp : 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla purus arcu, varius eget velit non, laoreet imperdiet orci. Mauris ultrices eget lorem ac vestibulum. Suspendisse imperdiet,",
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.body.copyWith(
            fontSize: 15.sp,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla purus arcu, varius eget velit non.",
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.body.copyWith(
            fontSize: 15.sp,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        SizedBox(height: 32.h),
        const _SayHelloButton(),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.title,
    required this.description,
    required this.isActive,
    required this.onHover,
  });

  final String title;
  final String description;
  final bool isActive;
  final ValueChanged<bool> onHover;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: isActive
            ? Matrix4.translationValues(0, -4.h, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: isActive
                  ? AppColors.primary.withOpacity(0.08)
                  : Colors.black.withOpacity(0.02),
              blurRadius: isActive ? 25.r : 20.r,
              offset: Offset(0, isActive ? 12.h : 8.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 4.w,
                  color: isActive ? AppColors.primary : Colors.transparent,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.h3.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      description,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                        height: 1.5,
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

class _SayHelloButton extends StatefulWidget {
  const _SayHelloButton();

  @override
  State<_SayHelloButton> createState() => _SayHelloButtonState();
}

class _SayHelloButtonState extends State<_SayHelloButton> {
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
              borderRadius: BorderRadius.circular(6.r),
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
            child: Text(
              'Say Hello!',
              style: AppTextStyles.button.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
