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
          "Let's discuss your Project",
          style: AppTextStyles.h2.copyWith(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.",
          style: AppTextStyles.body.copyWith(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        SizedBox(height: 32.h),
        const _ContactInfoTile(
          icon: Icons.location_on_rounded,
          label: 'Address:',
          value: 'New Mexico 31134',
          isActive: true,
        ),
        SizedBox(height: 16.h),
        const _ContactInfoTile(
          icon: Icons.email_rounded,
          label: 'My Email:',
          value: 'mymail@mail.com',
          isActive: false,
        ),
        SizedBox(height: 16.h),
        const _ContactInfoTile(
          icon: Icons.phone_rounded,
          label: 'Call Me Now:',
          value: '00-1234 00000',
          isActive: false,
        ),
        SizedBox(height: 40.h),
        const _SocialTray(),
      ],
    );
  }
}

class _ContactCardRight extends StatelessWidget {
  const _ContactCardRight();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.",
          style: AppTextStyles.body.copyWith(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        SizedBox(height: 24.h),
        const _CustomTextField(label: 'Name*'),
        SizedBox(height: 16.h),
        const _CustomTextField(label: 'Email*'),
        SizedBox(height: 16.h),
        const _CustomTextField(label: 'Location'),
        SizedBox(height: 16.h),
        Row(
          children: const [
            Expanded(child: _CustomTextField(label: 'Budget*')),
            SizedBox(width: 16),
            Expanded(child: _CustomTextField(label: 'Subject*')),
          ],
        ),
        SizedBox(height: 16.h),
        const _CustomTextField(label: 'Message*', isMultiline: true),
        SizedBox(height: 32.h),
        const _SubmitButton(),
      ],
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
        const _SocialIcon(icon: Icons.facebook, isFilled: true),
        SizedBox(width: 14.w),
        const _SocialIcon(icon: Icons.language_rounded),
        SizedBox(width: 14.w),
        const _BehanceTextIcon(),
        SizedBox(width: 14.w),
        const _SocialIcon(icon: Icons.camera_alt_outlined),
        SizedBox(width: 14.w),
        const _LinkedInTrayIcon(),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.icon, this.isFilled = false});

  final IconData icon;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.r,
      height: 32.r,
      decoration: BoxDecoration(
        color: isFilled ? AppColors.primary : Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: isFilled ? Colors.transparent : AppColors.border,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: isFilled ? Colors.white : AppColors.primary,
        size: 16.r,
      ),
    );
  }
}

class _LinkedInTrayIcon extends StatelessWidget {
  const _LinkedInTrayIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.r,
      height: 32.r,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        'in',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _BehanceTextIcon extends StatelessWidget {
  const _BehanceTextIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.r,
      height: 32.r,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        'Bē',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    required this.label,
    this.isMultiline = false,
  });

  final String label;
  final bool isMultiline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: isMultiline ? 4 : 1,
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
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.h),
      ),
    );
  }
}

class _SubmitButton extends StatefulWidget {
  const _SubmitButton();

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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Submit',
                  style: AppTextStyles.button.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                AnimatedSlide(
                  offset: _isHovered ? const Offset(0.25, 0) : Offset.zero,
                  duration: const Duration(milliseconds: 150),
                  child: Icon(
                    Icons.send_rounded,
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

class _FooterContent extends StatelessWidget {
  const _FooterContent();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return isDesktop
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _FooterLogo(),
              _FooterLinks(),
              _FooterCopyright(),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              _FooterLogo(),
              SizedBox(height: 32),
              _FooterLinks(isVertical: true),
              SizedBox(height: 32),
              _FooterCopyright(),
            ],
          );
  }
}

class _FooterLogo extends StatelessWidget {
  const _FooterLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks({this.isVertical = false});

  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final links = ['Home', 'About', 'Services', 'Process', 'Portfolio', 'Blog', 'Contact'];

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

    return Row(
      children: List.generate(links.length, (index) {
        return Padding(
          padding: EdgeInsets.only(right: index == links.length - 1 ? 0 : 20.w),
          child: _FooterLinkItem(label: links[index]),
        );
      }),
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
      'Copyright © 2026 Abdullah.',
      style: TextStyle(
        fontFamily: 'Work Sans',
        fontSize: 14.sp,
        color: Colors.white30,
      ),
    );
  }
}
