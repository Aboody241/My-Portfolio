import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _ProjectData {
  const _ProjectData({
    required this.tag,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final String tag;
  final String title;
  final String description;
  final String imageUrl;
}

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final isTablet = width >= 700 && width < 1024;

    final projects = [
      const _ProjectData(
        tag: 'UI-UX DESIGN',
        title: 'Product Admin Dashboard',
        description:
            'Vivamus eleifend convallis ante, non pharetra libero molestie laoreet. Donec id imperdiet lacus.',
        imageUrl:
            'https://images.unsplash.com/photo-1541701494587-cb58502866ab?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'UI-UX DESIGN',
        title: 'Product Admin Dashboard',
        description:
            'Vivamus eleifend convallis ante, non pharetra libero molestie laoreet. Donec id imperdiet lacus.',
        imageUrl:
            'https://images.unsplash.com/photo-1518005020951-eccb494ad742?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'UI-UX DESIGN',
        title: 'Product Admin Dashboard',
        description:
            'Vivamus eleifend convallis ante, non pharetra libero molestie laoreet. Donec id imperdiet lacus.',
        imageUrl:
            'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'UI-UX DESIGN',
        title: 'Product Admin Dashboard',
        description:
            'Vivamus eleifend convallis ante, non pharetra libero molestie laoreet. Donec id imperdiet lacus.',
        imageUrl:
            'https://images.unsplash.com/photo-1497366216548-37526070297c?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'UI-UX DESIGN',
        title: 'Product Admin Dashboard',
        description:
            'Vivamus eleifend convallis ante, non pharetra libero molestie laoreet. Donec id imperdiet lacus.',
        imageUrl:
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'UI-UX DESIGN',
        title: 'Product Admin Dashboard',
        description:
            'Vivamus eleifend convallis ante, non pharetra libero molestie laoreet. Donec id imperdiet lacus.',
        imageUrl:
            'https://images.unsplash.com/photo-1528183429752-a97d0bf99b5a?w=600&auto=format&fit=crop',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Portfolio",
                style: AppTextStyles.h2.copyWith(
                  fontSize: isDesktop ? 38.sp : 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                constraints: BoxConstraints(maxWidth: 600.w),
                child: Text(
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              _buildGrid(projects, isDesktop, isTablet),
              SizedBox(height: 48.h),
              const _MoreProjectsButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(List<_ProjectData> projects, bool isDesktop, bool isTablet) {
    if (isDesktop) {
      return Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(data: projects[0])),
                SizedBox(width: 32.w),
                Expanded(child: _ProjectCard(data: projects[1])),
                SizedBox(width: 32.w),
                Expanded(child: _ProjectCard(data: projects[2])),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(data: projects[3])),
                SizedBox(width: 32.w),
                Expanded(child: _ProjectCard(data: projects[4])),
                SizedBox(width: 32.w),
                Expanded(child: _ProjectCard(data: projects[5])),
              ],
            ),
          ),
        ],
      );
    } else if (isTablet) {
      return Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(data: projects[0])),
                SizedBox(width: 24.w),
                Expanded(child: _ProjectCard(data: projects[1])),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(data: projects[2])),
                SizedBox(width: 24.w),
                Expanded(child: _ProjectCard(data: projects[3])),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(data: projects[4])),
                SizedBox(width: 24.w),
                Expanded(child: _ProjectCard(data: projects[5])),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: projects
            .map((p) => Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: _ProjectCard(data: p),
                ))
            .toList(),
      );
    }
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.data});

  final _ProjectData data;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.translationValues(0, -8.h, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: _isHovered
                  ? AppColors.primary.withOpacity(0.08)
                  : Colors.black.withOpacity(0.02),
              blurRadius: _isHovered ? 30.r : 20.r,
              offset: Offset(0, _isHovered ? 15.h : 10.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 220.h,
                child: Image.network(
                  widget.data.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: AppColors.surface,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.surface,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.image_outlined,
                        size: 48.r,
                        color: AppColors.textLight,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.tag,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: AppColors.textLight,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.data.title,
                    style: AppTextStyles.h3.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    widget.data.description,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const _CaseStudyButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CaseStudyButton extends StatefulWidget {
  const _CaseStudyButton();

  @override
  State<_CaseStudyButton> createState() => _CaseStudyButtonState();
}

class _CaseStudyButtonState extends State<_CaseStudyButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: AppColors.primary,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Case Study',
                style: AppTextStyles.button.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: 8.w),
              AnimatedSlide(
                offset: _isHovered ? const Offset(0.2, 0) : Offset.zero,
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.primary,
                  size: 16.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoreProjectsButton extends StatefulWidget {
  const _MoreProjectsButton();

  @override
  State<_MoreProjectsButton> createState() => _MoreProjectsButtonState();
}

class _MoreProjectsButtonState extends State<_MoreProjectsButton> {
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
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
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
            child: Text(
              'More Project',
              style: AppTextStyles.button.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
