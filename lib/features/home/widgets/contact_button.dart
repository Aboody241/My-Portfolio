import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactButton extends StatefulWidget {
  const ContactButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isHovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: _isHovered ? AppColors.primaryDark : AppColors.primary,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 10.r,
                        offset: Offset(0, 4.h),
                      )
                    ]
                  : [],
            ),
            child: Text(
              'Contact',
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
