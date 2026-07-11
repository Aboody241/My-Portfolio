import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:abdullah_portfolio/features/home/widgets/contact_button.dart';
import 'package:abdullah_portfolio/features/home/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.onSectionSelected});

  final ValueChanged<String> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(),
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.textPrimary, size: 28.r),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              _DrawerItem(
                title: 'Home',
                onPressed: () => onSectionSelected('Home'),
              ),
              _DrawerItem(
                title: 'About',
                onPressed: () => onSectionSelected('About'),
              ),
              _DrawerItem(
                title: 'Skills',
                onPressed: () => onSectionSelected('Skills'),
              ),
              _DrawerItem(
                title: 'Featured Projects',
                onPressed: () => onSectionSelected('Featured Projects'),
              ),
              _DrawerItem(
                title: 'Services',
                onPressed: () => onSectionSelected('Services'),
              ),
              _DrawerItem(
                title: 'Experience / Process',
                onPressed: () => onSectionSelected('Experience / Process'),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ContactButton(
                  onPressed: () => onSectionSelected('Contact'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(); // Dismiss drawer
          onPressed();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Text(
            title,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
