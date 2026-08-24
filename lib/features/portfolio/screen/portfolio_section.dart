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
        tag: 'FLUTTER • MOBILE APP',
        title: 'E-Commerce Mobile Application',
        description:
            'A high-performance cross-platform shopping application built with Flutter, BLoC state management, and Stripe payments.',
        imageUrl:
            'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'FLUTTER • FINANCE',
        title: 'Finance & Expense Tracker App',
        description:
            'Clean architecture mobile application for financial budgeting, real-time analytics, and secure cloud synchronization.',
        imageUrl:
            'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'FLUTTER • HEALTHCARE',
        title: 'Telemedicine & Health App',
        description:
            'Patient-doctor appointment booking app with real-time chat, video consultations, and health metric tracking.',
        imageUrl:
            'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'FLUTTER • PRODUCTIVITY',
        title: 'Task & Team Workflow App',
        description:
            'Collaborative mobile productivity application with offline-first support, local caching, and push notifications.',
        imageUrl:
            'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'FLUTTER • FOOD & DELIVERY',
        title: 'Food Ordering & Delivery App',
        description:
            'Real-time order tracking mobile application with Google Maps integration, live driver updates, and seamless checkout.',
        imageUrl:
            'https://images.unsplash.com/photo-1526367790999-0150786686a2?w=600&auto=format&fit=crop',
      ),
      const _ProjectData(
        tag: 'FLUTTER • SOCIAL & REAL-TIME',
        title: 'Real-Time Chat & Community App',
        description:
            'Cross-platform messaging application powered by Firebase & WebSockets with end-to-end media sharing and voice notes.',
        imageUrl:
            'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=600&auto=format&fit=crop',
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
            vertical: isDesktop ? 80.h : 48.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Projects",
                style: AppTextStyles.h2.copyWith(
                  fontSize: isDesktop ? 38.sp : 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 14.h),
              Container(
                constraints: BoxConstraints(maxWidth: 620.w),
                child: Text(
                  "A showcase of real-world mobile applications built with Flutter and Dart, focusing on clean architecture, performance, and seamless user experiences.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    fontSize: isDesktop ? 16.sp : 14.sp,
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
                SizedBox(width: 28.w),
                Expanded(child: _ProjectCard(data: projects[1])),
                SizedBox(width: 28.w),
                Expanded(child: _ProjectCard(data: projects[2])),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(data: projects[3])),
                SizedBox(width: 28.w),
                Expanded(child: _ProjectCard(data: projects[4])),
                SizedBox(width: 28.w),
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
                SizedBox(width: 20.w),
                Expanded(child: _ProjectCard(data: projects[1])),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(data: projects[2])),
                SizedBox(width: 20.w),
                Expanded(child: _ProjectCard(data: projects[3])),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(data: projects[4])),
                SizedBox(width: 20.w),
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
                  padding: EdgeInsets.only(bottom: 20.h),
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
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.translationValues(0, -6.h, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: _isHovered ? 28.r : 16.r,
              offset: Offset(0, _isHovered ? 12.h : 6.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image Header with Aspect Ratio
              AspectRatio(
                aspectRatio: 16 / 10,
                child: Image.network(
                  widget.data.imageUrl,
                  fit: BoxFit.cover,
                  cacheWidth: 600,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: AppColors.surface,
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.surface,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.phone_android_rounded,
                        size: 44.r,
                        color: AppColors.textLight,
                      ),
                    );
                  },
                ),
              ),

              // Content Details
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Category Tag
                    Text(
                      widget.data.tag,
                      style: TextStyle(
                        fontFamily: 'Work Sans',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 6.h),

                    // Project Title
                    Text(
                      widget.data.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.h3.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Description
                    Text(
                      widget.data.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 13.5.sp,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 18.h),

                    // Action Button
                    _CaseStudyButton(isParentHovered: _isHovered),
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

class _CaseStudyButton extends StatelessWidget {
  const _CaseStudyButton({this.isParentHovered = false});

  final bool isParentHovered;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isParentHovered
            ? AppColors.primary
            : AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: AppColors.primary,
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Case Study',
            style: AppTextStyles.button.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: isParentHovered ? Colors.white : AppColors.primary,
            ),
          ),
          SizedBox(width: 6.w),
          AnimatedSlide(
            offset: isParentHovered ? const Offset(0.2, 0) : Offset.zero,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            child: Icon(
              Icons.arrow_forward_rounded,
              color: isParentHovered ? Colors.white : AppColors.primary,
              size: 15.r,
            ),
          ),
        ],
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
          scale: _isHovered ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 15.h),
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
                  'More Projects',
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
                  curve: Curves.easeOutCubic,
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 16.r,
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
