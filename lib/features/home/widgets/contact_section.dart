import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        // Background layer
        Column(
          children: [
            Container(
              height: isDesktop ? 340.h : 600.h,
              color: Colors.transparent,
            ),
            Container(
              width: double.infinity,
              color: AppColors.secondary,
              padding: EdgeInsets.only(
                top: isDesktop ? 320.h : 550.h,
                bottom: 40.h,
                left: isDesktop ? 100.w : 24.w,
                right: isDesktop ? 100.w : 24.w,
              ),
              child: const _FooterContent(),
            ),
          ],
        ),
        // Floating Contact Card
        Positioned(
          top: 40.h,
          left: isDesktop ? 100.w : 24.w,
          right: isDesktop ? 100.w : 24.w,
          child: const _ContactCard(),
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return Container(
      padding: EdgeInsets.all(isDesktop ? 48.r : 24.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.06),
            blurRadius: 40.r,
            offset: Offset(0, 20.h),
          ),
        ],
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 5,
                  child: _ContactCardLeft(),
                ),
                SizedBox(width: 48),
                Expanded(
                  flex: 6,
                  child: _ContactCardRight(),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _ContactCardLeft(),
                SizedBox(height: 48),
                _ContactCardRight(),
              ],
            ),
    );
  }
}

class _ContactCardLeft extends StatelessWidget {
  const _ContactCardLeft();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Connect",
          style: AppTextStyles.h2.copyWith(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "Have a project, an opportunity, or just want to talk about mobile development? Feel free to reach out.",
          style: AppTextStyles.body.copyWith(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        SizedBox(height: 32.h),
        const _ContactInfoTile(
          icon: Icons.location_on_rounded,
          label: 'Location',
          value: 'Based in Cairo, Egypt',
          isActive: true,
        ),
        SizedBox(height: 16.h),
        const _ContactInfoTile(
          icon: Icons.work_outline_rounded,
          label: 'Availability',
          value: 'Available for Remote Opportunities',
          isActive: false,
        ),
        SizedBox(height: 16.h),
        const _ContactInfoTile(
          icon: Icons.email_rounded,
          label: 'Email',
          value: 'ounabdallah216@gmail.com',
          isActive: false,
        ),
        SizedBox(height: 40.h),
        const _SocialTray(),
      ],
    );
  }
}

class _ContactCardRight extends StatefulWidget {
  const _ContactCardRight();

  @override
  State<_ContactCardRight> createState() => _ContactCardRightState();
}

class _ContactCardRightState extends State<_ContactCardRight> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;
  bool _showSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_isSubmitting) return; // Prevent duplicate submissions

    setState(() => _isSubmitting = true);

    // TODO: Connect to backend/email service (e.g., EmailJS, Formspree, Firebase Functions)
    // For now, simulate a submission delay
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    setState(() {
      _isSubmitting = false;
      _showSuccess = true;
    });

    // Clear form
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();

    // Hide success message after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() => _showSuccess = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomTextField(
            label: 'Name *',
            controller: _nameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          _CustomTextField(
            label: 'Email *',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value.trim())) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          _CustomTextField(
            label: 'Subject *',
            controller: _subjectController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a subject';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          _CustomTextField(
            label: 'Message *',
            controller: _messageController,
            isMultiline: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 32.h),

          // Success feedback
          if (_showSuccess) ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.success.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle_rounded,
                      color: AppColors.success, size: 18.r),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      'Message sent successfully! I\'ll get back to you soon.',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.success,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],

          _SubmitButton(
            isSubmitting: _isSubmitting,
            onTap: _handleSubmit,
          ),
        ],
      ),
    );
  }
}

class _ContactInfoTile extends StatelessWidget {
  const _ContactInfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.isActive = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          // ignore: deprecated_member_use
          color: isActive ? AppColors.border.withOpacity(0.5) : Colors.transparent,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10.r,
                  offset: Offset(0, 4.h),
                )
              ]
            : [],
      ),
      child: Row(
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: isActive ? AppColors.primary : AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: isActive ? Colors.white : AppColors.primary,
              size: 20.r,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.textLight,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialTray extends StatelessWidget {
  const _SocialTray();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _SocialIconButton(
          icon: Icons.code_rounded,
          label: 'GitHub',
          isFilled: true,
        ),
        SizedBox(width: 14.w),
        const _LinkedInButton(isFilled: false),
        SizedBox(width: 14.w),
        const _SocialIconButton(
          icon: Icons.email_outlined,
          label: 'Email',
          isFilled: false,
        ),
      ],
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  const _SocialIconButton({
    required this.icon,
    required this.label,
    this.isFilled = false,
  });

  final IconData icon;
  final String label;
  final bool isFilled;

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: widget.label,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          width: 36.r,
          height: 36.r,
          decoration: BoxDecoration(
            color: (widget.isFilled || _isHovered)
                ? AppColors.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: (widget.isFilled || _isHovered)
                  ? Colors.transparent
                  : AppColors.border,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            widget.icon,
            color: (widget.isFilled || _isHovered)
                ? Colors.white
                : AppColors.primary,
            size: 18.r,
          ),
        ),
      ),
    );
  }
}

class _LinkedInButton extends StatefulWidget {
  const _LinkedInButton({this.isFilled = false});

  final bool isFilled;

  @override
  State<_LinkedInButton> createState() => _LinkedInButtonState();
}

class _LinkedInButtonState extends State<_LinkedInButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: 'LinkedIn',
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          width: 36.r,
          height: 36.r,
          decoration: BoxDecoration(
            color: (widget.isFilled || _isHovered)
                ? AppColors.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: (widget.isFilled || _isHovered)
                  ? Colors.transparent
                  : AppColors.border,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            'in',
            style: TextStyle(
              color: (widget.isFilled || _isHovered)
                  ? Colors.white
                  : AppColors.primary,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    required this.label,
    this.isMultiline = false,
    this.controller,
    this.validator,
    this.keyboardType,
  });

  final String label;
  final bool isMultiline;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: isMultiline ? 4 : 1,
      keyboardType: keyboardType,
      style: AppTextStyles.body.copyWith(
        fontSize: 14.sp,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.textLight,
          fontSize: 14.sp,
        ),
        alignLabelWithHint: true,
        floatingLabelStyle: const TextStyle(color: AppColors.primary),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border, width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
        errorStyle: TextStyle(
          color: AppColors.error,
          fontSize: 11.sp,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.h),
      ),
    );
  }
}

class _SubmitButton extends StatefulWidget {
  const _SubmitButton({
    required this.isSubmitting,
    required this.onTap,
  });

  final bool isSubmitting;
  final VoidCallback onTap;

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.isSubmitting
          ? SystemMouseCursors.wait
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.isSubmitting ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: (_isHovered && !widget.isSubmitting)
              ? Matrix4.translationValues(0, -2.h, 0)
              : Matrix4.identity(),
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: widget.isSubmitting
                ? AppColors.primary.withValues(alpha: 0.7)
                : (_isHovered ? AppColors.primaryDark : AppColors.primary),
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: (_isHovered && !widget.isSubmitting)
                ? [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 16.r,
                      offset: Offset(0, 6.h),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isSubmitting)
                SizedBox(
                  width: 16.r,
                  height: 16.r,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              else ...[
                Text(
                  'Send Message',
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
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 16.r,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterContent extends StatelessWidget {
  const _FooterContent();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return isDesktop
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _FooterIdentity(),
              _FooterLinks(),
              _FooterCopyright(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              _FooterIdentity(),
              SizedBox(height: 32),
              _FooterLinks(isVertical: true),
              SizedBox(height: 32),
              _FooterCopyright(),
            ],
          );
  }
}

class _FooterIdentity extends StatelessWidget {
  const _FooterIdentity();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 950;

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                'A',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'Abdullah',
              style: AppTextStyles.h3.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.only(left: isMobile ? 0 : 48.w),
          child: Text(
            'Mobile App Engineer · Flutter & Dart',
            style: TextStyle(
              fontFamily: 'Work Sans',
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks({this.isVertical = false});

  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final links = [
      'Home',
      'About',
      'Skills',
      'What I Do',
      'How I Work',
      'Projects',
      'Contact',
    ];

    if (isVertical) {
      return Column(
        children: links
            .map((link) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _FooterLinkItem(label: link),
                ))
            .toList(),
      );
    }

    return Wrap(
      spacing: 20.w,
      runSpacing: 8.h,
      alignment: WrapAlignment.center,
      children: links.map((link) => _FooterLinkItem(label: link)).toList(),
    );
  }
}

class _FooterLinkItem extends StatefulWidget {
  const _FooterLinkItem({required this.label});

  final String label;

  @override
  State<_FooterLinkItem> createState() => _FooterLinkItemState();
}

class _FooterLinkItemState extends State<_FooterLinkItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 150),
        style: TextStyle(
          fontFamily: 'Work Sans',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: _isHovered ? AppColors.primary : Colors.white70,
        ),
        child: Text(widget.label),
      ),
    );
  }
}

class _FooterCopyright extends StatelessWidget {
  const _FooterCopyright();

  @override
  Widget build(BuildContext context) {
    return Text(
      '© 2026 Abdullah Essam. All rights reserved.',
      style: TextStyle(
        fontFamily: 'Work Sans',
        fontSize: 14.sp,
        color: Colors.white30,
      ),
    );
  }
}
