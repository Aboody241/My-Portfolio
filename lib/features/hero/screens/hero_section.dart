import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 100.w : 24.w,
            vertical: isDesktop ? 80.h : 40.h,
          ),
          child: isDesktop ? const _DesktopHero() : const _MobileHero(),
        ),
      ),
    );
  }
}

class _DesktopHero extends StatelessWidget {
  const _DesktopHero();

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
              const _HeroContent(),
              SizedBox(height: 48.h),
              const _StatsBar(),
            ],
          ),
        ),
        SizedBox(width: 60.w),
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
  const _MobileHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const _HeroAvatar(),
        SizedBox(height: 40.h),
        const _HeroContent(isCentered: true),
        SizedBox(height: 40.h),
        const _StatsBar(),
      ],
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({this.isCentered = false});

  final bool isCentered;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I'm",
          style: AppTextStyles.h1.copyWith(
            fontSize: isCentered ? 36.sp : 56.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.1,
          ),
        ),
        Text(
          "Abdullah Essam",
          style: AppTextStyles.h1.copyWith(
            fontSize: isCentered ? 40.sp : 60.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isCentered ? 16.w : 0),
          child: RichText(
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
            text: TextSpan(
              style: AppTextStyles.body.copyWith(
                fontSize: 16.sp,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
              children: [
                const TextSpan(text: "I'm a Freelance "),
                TextSpan(
                  text: "UI/UX Designer",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    // ignore: deprecated_member_use
                    decorationColor: AppColors.primary.withOpacity(0.4),
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                ),
                const TextSpan(text: " and "),
                TextSpan(
                  text: "Developer",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    // ignore: deprecated_member_use
                    decorationColor: AppColors.primary.withOpacity(0.4),
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                ),
                const TextSpan(
                  text:
                      " based in London, England. I strive to build immersive and beautiful web applications through carefully crafted code and user-centric design.",
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 32.h),
        const _SayHelloButton(),
      ],
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
              'Download CV',
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

class _HeroAvatar extends StatelessWidget {
  const _HeroAvatar();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    final cardSize = isDesktop ? 540.r : 300.r;

    return Container(
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.04),
            blurRadius: 30.r,
            offset: Offset(0, 15.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Transform.scale(
          scale: 1,
          alignment: const Alignment(-0.10, 0.40),
          child: Image.asset(
            'assets/images/image1.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.person,
                  size: 80.r,
                  color: AppColors.textLight,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StatsBar extends StatelessWidget {
  const _StatsBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Expanded(
              child: _StatItem(
                value: '15 Y.',
                label: 'Experience',
              ),
            ),
            VerticalDivider(
              color: AppColors.white,
              thickness: 4,
            ),
            Expanded(
              child: _StatItem(
                value: '250+',
                label: 'Project Completed',
              ),
            ),
            VerticalDivider(
              color: AppColors.white,
              thickness: 4,
            ),
            Expanded(
              child: _StatItem(
                value: '58',
                label: 'Happy Client',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: AppTextStyles.h3.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 13.sp,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
