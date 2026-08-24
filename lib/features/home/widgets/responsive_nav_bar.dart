import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:abdullah_portfolio/features/home/widgets/contact_button.dart';
import 'package:abdullah_portfolio/features/home/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveNavBar extends StatelessWidget {
  const ResponsiveNavBar({super.key, required this.onSectionSelected});

  final ValueChanged<String> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: isDesktop
          ? _DesktopNavBar(onSectionSelected: onSectionSelected)
          : _MobileNavBar(onSectionSelected: onSectionSelected),
    );
  }
}

class _DesktopNavBar extends StatelessWidget {
  const _DesktopNavBar({required this.onSectionSelected});

  final ValueChanged<String> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        Row(
          children: [
            _NavAction(
              title: 'Home',
              onPressed: () => onSectionSelected('Home'),
              isActive: true,
            ),
            SizedBox(width: 28.w),
            _NavAction(
              title: 'About',
              onPressed: () => onSectionSelected('About'),
            ),
            SizedBox(width: 28.w),
            _NavAction(
              title: 'Skills',
              onPressed: () => onSectionSelected('Skills'),
            ),
            SizedBox(width: 28.w),
            _NavAction(
              title: 'What I Do',
              onPressed: () => onSectionSelected('What I Do'),
            ),
            SizedBox(width: 28.w),
            _NavAction(
              title: 'How I Work',
              onPressed: () => onSectionSelected('How I Work'),
            ),
            SizedBox(width: 28.w),
            _NavAction(
              title: 'Projects',
              onPressed: () => onSectionSelected('Projects'),
            ),
            SizedBox(width: 28.w),
            ContactButton(onPressed: () => onSectionSelected('Contact')),
          ],
        ),
      ],
    );
  }
}

class _MobileNavBar extends StatelessWidget {
  const _MobileNavBar({required this.onSectionSelected});

  final ValueChanged<String> onSectionSelected;

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
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: widget.isActive
                ? AppColors.primary
                : (_isHovered ? AppColors.primary : AppColors.textPrimary),
          ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
