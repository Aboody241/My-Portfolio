import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillItem {
  final String name;
  final String descriptor;
  final String iconUrl;
  final IconData fallbackIcon;
  final bool isCore;

  const SkillItem({
    required this.name,
    required this.descriptor,
    required this.iconUrl,
    required this.fallbackIcon,
    this.isCore = false,
  });
}

class SkillCategory {
  final String title;
  final List<SkillItem> skills;

  const SkillCategory({required this.title, required this.skills});
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<SkillCategory> categories = [
    SkillCategory(
      title: "MOBILE DEVELOPMENT",
      skills: [
        SkillItem(
          name: "Flutter",
          descriptor: "Cross-platform Mobile Development",
          iconUrl: "https://img.icons8.com/color/96/flutter.png",
          fallbackIcon: Icons.flutter_dash,
          isCore: true,
        ),
        SkillItem(
          name: "Dart",
          descriptor: "Application Development",
          iconUrl: "https://img.icons8.com/color/96/dart.png",
          fallbackIcon: Icons.code_rounded,
          isCore: true,
        ),
        SkillItem(
          name: "iOS / SwiftUI",
          descriptor: "Native iOS Development",
          iconUrl: "https://img.icons8.com/color/96/swift.png",
          fallbackIcon: Icons.apple_rounded,
          isCore: true,
        ),
        SkillItem(
          name: "Android SDK",
          descriptor: "Android Development",
          iconUrl: "https://img.icons8.com/color/96/android-os.png",
          fallbackIcon: Icons.android_rounded,
          isCore: false,
        ),
      ],
    ),
    SkillCategory(
      title: "ARCHITECTURE & INTEGRATION",
      skills: [
        SkillItem(
          name: "Clean Architecture",
          descriptor: "Scalable & Maintainable Code",
          iconUrl: "https://img.icons8.com/color/96/clean-code.png",
          fallbackIcon: Icons.layers_rounded,
          isCore: true,
        ),
        SkillItem(
          name: "BLoC / Cubit",
          descriptor: "Predictable State Management",
          iconUrl:
              "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png",
          fallbackIcon: Icons.alt_route_rounded,
          isCore: true,
        ),
        SkillItem(
          name: "REST APIs",
          descriptor: "API Integration",
          iconUrl: "https://img.icons8.com/color/96/connected.png",
          fallbackIcon: Icons.hub_rounded,
          isCore: true,
        ),
        SkillItem(
          name: "Firebase",
          descriptor: "Authentication & Cloud Services",
          iconUrl: "https://img.icons8.com/color/96/firebase.png",
          fallbackIcon: Icons.local_fire_department_rounded,
          isCore: false,
        ),
        SkillItem(
          name: "Supabase",
          descriptor: "Database & Backend Services",
          iconUrl: "https://img.icons8.com/color/96/supabase.png",
          fallbackIcon: Icons.bolt_rounded,
          isCore: false,
        ),
        SkillItem(
          name: "Dependency Injection",
          descriptor: "Modular Application Design",
          iconUrl: "https://img.icons8.com/fluency/96/module.png",
          fallbackIcon: Icons.extension_rounded,
          isCore: false,
        ),
      ],
    ),
    SkillCategory(
      title: "TOOLS & WORKFLOW",
      skills: [
        SkillItem(
          name: "Git & GitHub",
          descriptor: "Version Control",
          iconUrl: "https://img.icons8.com/color/96/git.png",
          fallbackIcon: Icons.commit_rounded,
          isCore: false,
        ),
        SkillItem(
          name: "VS Code",
          descriptor: "Development Environment",
          iconUrl: "https://img.icons8.com/color/96/visual-studio-code-2.png",
          fallbackIcon: Icons.terminal_rounded,
          isCore: false,
        ),
        SkillItem(
          name: "Postman",
          descriptor: "API Testing",
          iconUrl: "https://img.icons8.com/color/96/postman.png",
          fallbackIcon: Icons.send_rounded,
          isCore: false,
        ),
        SkillItem(
          name: "Figma",
          descriptor: "Interface Prototyping",
          iconUrl: "https://img.icons8.com/color/96/figma.png",
          fallbackIcon: Icons.draw_rounded,
          isCore: false,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    final horizontalPadding = isDesktop
        ? 100.w
        : isTablet
            ? 48.w
            : 24.w;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0A0A0A),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isDesktop ? 80.h : 48.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtitle Tag
          Text(
            "TECHNICAL EXPERTISE",
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: const Color(0xFFA78BFA),
            ),
          ),
          SizedBox(height: 8.h),

          // Main Header
          Text(
            "Skills & Capabilities",
            style: GoogleFonts.inter(
              fontSize: isDesktop ? 36.sp : 26.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFF3F4F6),
              height: 1.2,
            ),
          ),
          SizedBox(height: 12.h),

          // Subtitle description
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 620.w),
            child: Text(
              "Focused on building robust, high-performance cross-platform mobile applications with clean architecture, structured state management, and reliable backend integrations.",
              style: GoogleFonts.inter(
                fontSize: isDesktop ? 15.sp : 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF9CA3AF),
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: 48.h),

          // Categories List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (context, index) => SizedBox(height: 44.h),
            itemBuilder: (context, index) {
              return _SkillCategoryBlock(
                category: categories[index],
                screenWidth: screenWidth,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCategoryBlock extends StatelessWidget {
  final SkillCategory category;
  final double screenWidth;

  const _SkillCategoryBlock({
    required this.category,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 4;
    if (screenWidth < 640) {
      crossAxisCount = 1;
    } else if (screenWidth < 1024) {
      crossAxisCount = 2;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Label with vertical purple indicator
        Row(
          children: [
            Container(
              width: 3.w,
              height: 14.h,
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              category.title,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: const Color(0xFFD1D5DB),
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),

        // Skill Cards Grid
        LayoutBuilder(
          builder: (context, constraints) {
            final spacing = 16.w;
            final totalSpacing = spacing * (crossAxisCount - 1);
            final itemWidth =
                (constraints.maxWidth - totalSpacing) / crossAxisCount;

            return Wrap(
              spacing: spacing,
              runSpacing: 16.h,
              children: category.skills.map((skill) {
                return SizedBox(
                  width: itemWidth,
                  child: _SkillCard(skill: skill),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillItem skill;

  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isCore = widget.skill.isCore;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.translationValues(0, -4.h, 0)
            : Matrix4.identity(),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF8B5CF6)
                : (isCore
                    ? const Color(0xFF8B5CF6).withValues(alpha: 0.28)
                    : const Color(0xFF222226)),
            width: isCore ? 1.2 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? const Color(0xFF8B5CF6).withValues(alpha: 0.16)
                  : (isCore
                      ? const Color(0xFF8B5CF6).withValues(alpha: 0.04)
                      : Colors.black.withValues(alpha: 0.2)),
              blurRadius: _isHovered ? 20.r : 10.r,
              offset: Offset(0, _isHovered ? 8.h : 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top: Icon + Core indicator badge if core
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? const Color(0xFF8B5CF6).withValues(alpha: 0.18)
                        : (isCore
                            ? const Color(0xFF8B5CF6).withValues(alpha: 0.10)
                            : const Color(0xFF1A1A1E)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOutCubic,
                    scale: _isHovered ? 1.08 : 1.0,
                    child: Image.network(
                      widget.skill.iconUrl,
                      width: 24.r,
                      height: 24.r,
                      fit: BoxFit.contain,
                      cacheWidth: 48,
                      cacheHeight: 48,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          widget.skill.fallbackIcon,
                          size: 22.r,
                          color: _isHovered
                              ? const Color(0xFFA78BFA)
                              : (isCore
                                  ? const Color(0xFFA78BFA)
                                  : const Color(0xFF9CA3AF)),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          width: 24.r,
                          height: 24.r,
                          child: Center(
                            child: SizedBox(
                              width: 12.r,
                              height: 12.r,
                              child: const CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: Color(0xFFA78BFA),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (isCore)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B5CF6).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      "CORE",
                      style: GoogleFonts.inter(
                        fontSize: 9.5.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: const Color(0xFFA78BFA),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 14.h),

            // Skill Name
            Text(
              widget.skill.name,
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                fontWeight: isCore ? FontWeight.w700 : FontWeight.w600,
                color: const Color(0xFFF3F4F6),
                letterSpacing: -0.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),

            // Short Descriptor
            Text(
              widget.skill.descriptor,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF9CA3AF),
                height: 1.35,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 14.h),

            // Short decorative accent line (NOT a proficiency bar)
            AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              height: 2.5.h,
              width: _isHovered ? 56.w : 36.w,
              decoration: BoxDecoration(
                color: _isHovered
                    ? const Color(0xFFA78BFA)
                    : (isCore
                        ? const Color(0xFF8B5CF6).withValues(alpha: 0.7)
                        : const Color(0xFF8B5CF6).withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(2.r),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: const Color(0xFF8B5CF6).withValues(alpha: 0.5),
                          blurRadius: 6,
                          spreadRadius: 0,
                        ),
                      ]
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
