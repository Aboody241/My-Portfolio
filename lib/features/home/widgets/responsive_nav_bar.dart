import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:abdullah_portfolio/features/home/widgets/contact_button.dart';
import 'package:abdullah_portfolio/features/home/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveNavBar extends StatelessWidget {
  const ResponsiveNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: isDesktop ? const _DesktopNavBar() : const _MobileNavBar(),
    );
  }
}

class _DesktopNavBar extends StatelessWidget {
  const _DesktopNavBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        Row(
          children: [
            _NavAction(title: 'Home', onPressed: () {}, isActive: true),
            SizedBox(width: 32.w),
            _NavAction(title: 'About', onPressed: () {}),
            SizedBox(width: 32.w),
            _NavAction(title: 'Skills', onPressed: () {}),
            SizedBox(width: 32.w),
            _NavAction(title: 'Featured Projects', onPressed: () {}),
            SizedBox(width: 32.w),
            _NavAction(title: 'Services', onPressed: () {}),
            SizedBox(width: 32.w),
            _NavAction(title: 'Experience / Process', onPressed: () {}),
            SizedBox(width: 32.w),
            ContactButton(onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

class _MobileNavBar extends StatelessWidget {
  const _MobileNavBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        IconButton(
          icon: Icon(Icons.menu, color: AppColors.textPrimary, size: 28.r),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ],
    );
  }
}

class _NavAction extends StatefulWidget {
  const _NavAction({
    required this.title,
    required this.onPressed,
    this.isActive = false,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  State<_NavAction> createState() => _NavActionState();
}

class _NavActionState extends State<_NavAction> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: AppTextStyles.body.copyWith(
            color: widget.isActive || _isHovered
                ? AppColors.primary
                : AppColors.textSecondary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
