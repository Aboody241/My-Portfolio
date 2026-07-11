import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _StepData {
  const _StepData({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });

  final String number;
  final String title;
  final String description;
  final IconData icon;
}

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    final steps = [
      const _StepData(
        number: '01',
        title: 'Discovery',
        description:
            'Discuss project goals, requirements, target audience, and business needs to align on scope.',
        icon: Icons.search_rounded,
      ),
      const _StepData(
        number: '02',
        title: 'Planning',
        description:
            'Create project structure, user flow, timeline milestones, and solid technical architecture.',
        icon: Icons.architecture_rounded,
      ),
      const _StepData(
        number: '03',
        title: 'UI / UX Design',
        description:
            'Design a clean, modern, user-friendly interface focused on usability and premium brand aesthetics.',
        icon: Icons.palette_outlined,
      ),
      const _StepData(
        number: '04',
        title: 'Development',
        description:
            'Build the project using clean architecture, Flutter, responsive designs, and clean code best practices.',
        icon: Icons.code_rounded,
      ),
      const _StepData(
        number: '05',
        title: 'Testing & Polish',
        description:
            'Test performance, cross-device responsiveness, fix bugs, and refine micro-animations.',
        icon: Icons.bug_report_outlined,
      ),
      const _StepData(
        number: '06',
        title: 'Launch & Support',
        description:
            'Deploy the project live and provide ongoing support, monitoring, and future iterations.',
        icon: Icons.rocket_launch_outlined,
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
                "WORKFLOW",
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "How I Bring Ideas to Life.",
                textAlign: TextAlign.center,
                style: AppTextStyles.h2.copyWith(
                  fontSize: isDesktop ? 38.sp : 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 64.h),
              isDesktop
                  ? _DesktopProcessGrid(steps: steps)
                  : _MobileProcessTimeline(steps: steps),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopProcessGrid extends StatelessWidget {
  const _DesktopProcessGrid({required this.steps});

  final List<_StepData> steps;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 60.h,
          bottom: 60.h,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 2.w,
              color: AppColors.border,
            ),
          ),
        ),
        Column(
          children: [
            _buildRow(steps[0], isLeft: true),
            SizedBox(height: 32.h),
            _buildRow(steps[1], isLeft: false),
            SizedBox(height: 32.h),
            _buildRow(steps[2], isLeft: true),
            SizedBox(height: 32.h),
            _buildRow(steps[3], isLeft: false),
            SizedBox(height: 32.h),
            _buildRow(steps[4], isLeft: true),
            SizedBox(height: 32.h),
            _buildRow(steps[5], isLeft: false),
          ],
        ),
      ],
    );
  }

  Widget _buildRow(_StepData step, {required bool isLeft}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: isLeft
                ? _ProcessCard(data: step)
                : const SizedBox.shrink(),
          ),
          SizedBox(
            width: 80.w,
            child: Center(
              child: Container(
                width: 14.r,
                height: 14.r,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 6.r,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: !isLeft
                ? _ProcessCard(data: step)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _MobileProcessTimeline extends StatelessWidget {
  const _MobileProcessTimeline({required this.steps});

  final List<_StepData> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final isLast = index == steps.length - 1;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    width: 12.r,
                    height: 12.r,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 6.r,
                        )
                      ],
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2.w,
                        color: AppColors.border,
                      ),
                    ),
                ],
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: _ProcessCard(data: steps[index]),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _ProcessCard extends StatefulWidget {
  const _ProcessCard({required this.data});

  final _StepData data;

  @override
  State<_ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<_ProcessCard> {
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
            ? Matrix4.translationValues(0, -6.h, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            // ignore: deprecated_member_use
            color: _isHovered ? AppColors.primary.withOpacity(0.3) : AppColors.border,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: _isHovered
                  ? AppColors.primary.withOpacity(0.08)
                  : Colors.black.withOpacity(0.02),
              blurRadius: _isHovered ? 25.r : 20.r,
              offset: Offset(0, _isHovered ? 12.h : 10.h),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 3.h,
              left: 40.w,
              right: 40.w,
              child: Container(
                height: 3.h,
                color: AppColors.primary,
              ),
            ),
            Positioned(
              top: 15.h,
              right: 24.w,
              child: Text(
                widget.data.number,
                style: TextStyle(
                  fontSize: 54.sp,
                  fontWeight: FontWeight.bold,
                  // ignore: deprecated_member_use
                  color: AppColors.primary.withOpacity(0.06),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.12 : 1.0,
                    duration: const Duration(milliseconds: 150),
                    child: Container(
                      width: 48.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: _isHovered ? AppColors.primary.withOpacity(0.1) : AppColors.surface,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _isHovered ? AppColors.primary : AppColors.border,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        widget.data.icon,
                        color: _isHovered ? AppColors.primary : AppColors.textSecondary,
                        size: 22.r,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
