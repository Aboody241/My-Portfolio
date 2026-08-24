import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillItem {
  final String name;
  final String iconUrl;

  const SkillItem({required this.name, required this.iconUrl});
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
          iconUrl: "https://img.icons8.com/color/96/flutter.png",
        ),
        SkillItem(
          name: "Dart",
          iconUrl: "https://img.icons8.com/color/96/dart.png",
        ),
        SkillItem(
          name: "Android SDK",
          iconUrl: "https://img.icons8.com/color/96/android-os.png",
        ),
        SkillItem(
          name: "iOS / SwiftUI",
          iconUrl: "https://img.icons8.com/color/96/swift.png",
        ),
      ],
    ),
    SkillCategory(
      title: "BACKEND & ARCHITECTURE",
      skills: [
        SkillItem(
          name: "Clean Architecture",
          iconUrl: "https://img.icons8.com/color/96/clean-code.png",
        ),
        SkillItem(
          name: "BLoC & State",
          iconUrl:
              "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png",
        ),
        SkillItem(
          name: "Firebase & Supabase",
          iconUrl: "https://img.icons8.com/color/96/firebase.png",
        ),
        SkillItem(
          name: "REST & GraphQL APIs",
          iconUrl: "https://img.icons8.com/color/96/graphql.png",
        ),
      ],
    ),
    SkillCategory(
      title: "TOOLS & WORKFLOW",
      skills: [
        SkillItem(
          name: "Git & GitHub",
          iconUrl: "https://img.icons8.com/color/96/git.png",
        ),
        SkillItem(
          name: "Figma",
          iconUrl: "https://img.icons8.com/color/96/figma.png",
        ),
        SkillItem(
          name: "VS Code & Tooling",
          iconUrl: "https://img.icons8.com/color/96/visual-studio-code-2.png",
        ),
        SkillItem(
          name: "Postman",
          iconUrl: "https://img.icons8.com/color/96/postman.png",
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
          // Section Subtitle / Category Tag
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
            constraints: BoxConstraints(maxWidth: 600.w),
            child: Text(
              "Focused on building robust cross-platform applications with clean code architecture, intuitive interfaces, and efficient developer tooling.",
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
            separatorBuilder: (context, index) => SizedBox(height: 48.h),
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
        // Category Uppercase Label with a small indicator line
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
        SizedBox(height: 20.h),

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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF8B5CF6)
                : const Color(0xFF222226),
            width: 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF8B5CF6).withOpacity(0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top: Icon / Image
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: _isHovered
                    ? const Color(0xFF8B5CF6).withOpacity(0.15)
                    : const Color(0xFF1A1A1E),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.network(
                widget.skill.iconUrl,
                width: 24.r,
                height: 24.r,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.code_rounded,
                    size: 20.r,
                    color: _isHovered
                        ? const Color(0xFFA78BFA)
                        : const Color(0xFF9CA3AF),
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
            SizedBox(height: 16.h),

            // Skill Name
            Text(
              widget.skill.name,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFF3F4F6),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12.h),

            // Full-width Solid Line (100% complete line)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _isHovered
                    ? const Color(0xFFA78BFA)
                    : const Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(2.r),
                boxShadow: _isHovered
                    ? [const BoxShadow(color: Color(0xFF8B5CF6), blurRadius: 4)]
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
