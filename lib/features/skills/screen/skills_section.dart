import 'package:abdullah_portfolio/core/theme/app_text_styles.dart';
import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TECHNICAL SKILLS",
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Tech Stack & Expertise.",
                style: AppTextStyles.h2.copyWith(
                  fontSize: isDesktop ? 38.sp : 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 48.h),
              isDesktop ? const _DesktopGrid() : const _MobileGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopGrid extends StatelessWidget {
  const _DesktopGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 2,
                child: _MobileDevCard(),
              ),
              SizedBox(width: 32.w),
              const Expanded(
                flex: 1,
                child: _ArchitectureCard(),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 1,
                child: _BackendCard(),
              ),
              SizedBox(width: 32.w),
              const Expanded(
                flex: 2,
                child: _AiAutomationCard(),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        const _ToolsTray(),
      ],
    );
  }
}

class _MobileGrid extends StatelessWidget {
  const _MobileGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _MobileDevCard(),
        SizedBox(height: 24.h),
        const _ArchitectureCard(),
        SizedBox(height: 24.h),
        const _BackendCard(),
        SizedBox(height: 24.h),
        const _AiAutomationCard(),
        SizedBox(height: 24.h),
        const _ToolsTray(),
      ],
    );
  }
}

class _BentoCard extends StatefulWidget {
  const _BentoCard({
    required this.child,
  });

  final Widget child;

  @override
  State<_BentoCard> createState() => _BentoCardState();
}

class _BentoCardState extends State<_BentoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.translationValues(0, -6.h, 0)
            : Matrix4.identity(),
        padding: EdgeInsets.all(40.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
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
              blurRadius: _isHovered ? 30.r : 20.r,
              offset: Offset(0, _isHovered ? 15.h : 10.h),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

class _MobileDevCard extends StatelessWidget {
  const _MobileDevCard();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return _BentoCard(
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _CardHeader(
                  subtitle: "SPECIALIZATION",
                  title: "Mobile Development",
                  description:
                      "Building responsive, high-performance applications with native feel across iOS and Android.",
                ),
                SizedBox(height: 16.h),
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: const [
                    _SkillTag(label: 'Flutter'),
                    _SkillTag(label: 'Dart'),
                    _SkillTag(label: 'Android SDK'),
                    _SkillTag(label: 'Responsive Design'),
                  ],
                ),
              ],
            ),
          ),
          if (isDesktop) ...[
            SizedBox(width: 24.w),
            const Expanded(
              flex: 9,
              child: Center(
                child: _PhoneMockup(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PhoneMockup extends StatelessWidget {
  const _PhoneMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 230.h,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: AppColors.border,
          width: 4,
        ),
      ),
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 50.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            height: 32.h,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(
                width: 24.r,
                height: 24.r,
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 50.w,
                height: 8.h,
                color: Colors.white30,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(width: 40.w, height: 6.h, color: Colors.white30),
                Container(width: double.infinity, height: 6.h, color: Colors.white24),
                Container(width: 70.w, height: 6.h, color: Colors.white24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ArchitectureCard extends StatelessWidget {
  const _ArchitectureCard();

  @override
  Widget build(BuildContext context) {
    return _BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _CardHeader(
            subtitle: "CLEAN CODE",
            title: "Architecture",
            description: "Writing scalable, testable, and maintainable systems.",
          ),
          SizedBox(height: 16.h),
          const _ArchitectureVisual(),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: const [
              _SkillTag(label: 'Clean Architecture'),
              _SkillTag(label: 'BLoC / State'),
              _SkillTag(label: 'GetIt'),
              _SkillTag(label: 'Repository Pattern'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArchitectureVisual extends StatelessWidget {
  const _ArchitectureVisual();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _VisualPill(label: 'Presentation (UI/BLoC)', color: AppColors.primary),
        _VisualArrow(),
        _VisualPill(label: 'Domain (Use Cases)', color: AppColors.textPrimary),
        _VisualArrow(),
        _VisualPill(label: 'Data (Repo/DataSource)', color: AppColors.textSecondary),
      ],
    );
  }
}

class _VisualPill extends StatelessWidget {
  const _VisualPill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          // ignore: deprecated_member_use
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _VisualArrow extends StatelessWidget {
  const _VisualArrow();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_downward_rounded,
      size: 14.r,
      color: AppColors.textLight,
    );
  }
}

class _BackendCard extends StatelessWidget {
  const _BackendCard();

  @override
  Widget build(BuildContext context) {
    return _BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _CardHeader(
            subtitle: "CLOUD & API",
            title: "Backend Integration",
            description: "Connecting apps with real-time databases and REST endpoints.",
          ),
          SizedBox(height: 16.h),
          const _BackendVisual(),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: const [
              _SkillTag(label: 'Firebase'),
              _SkillTag(label: 'Supabase'),
              _SkillTag(label: 'REST APIs'),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackendVisual extends StatelessWidget {
  const _BackendVisual();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CustomPaint(
            size: Size(double.infinity, 2.h),
            painter: _DottedLinePainter(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NodeCircle(label: 'App', color: AppColors.primary),
              _NodeCircle(label: 'API', color: AppColors.textPrimary),
              _NodeCircle(label: 'Cloud', color: AppColors.primaryDark),
            ],
          ),
          
        ],
      ),
    );
  }
}

class _NodeCircle extends StatelessWidget {
  const _NodeCircle({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.r,
      height: 48.r,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: color.withOpacity(0.15),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 4.0;
    double startX = 40.0;
    while (startX < size.width - 40.0) {
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AiAutomationCard extends StatelessWidget {
  const _AiAutomationCard();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return _BentoCard(
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _CardHeader(
                  subtitle: "EMERGING TECH",
                  title: "AI & Automation",
                  description:
                      "Integrating LLMs, prompt pipelines, and Python script workflows to build smart products.",
                ),
                SizedBox(height: 16.h),
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: const [
                    _SkillTag(label: 'AI Automation'),
                    _SkillTag(label: 'Prompt Eng.'),
                    _SkillTag(label: 'Python'),
                    _SkillTag(label: 'OpenAI APIs'),
                  ],
                ),
              ],
            ),
          ),
          if (isDesktop) ...[
            SizedBox(width: 24.w),
            const Expanded(
              flex: 9,
              child: Center(
                child: _TerminalMockup(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TerminalMockup extends StatefulWidget {
  const _TerminalMockup();

  @override
  State<_TerminalMockup> createState() => _TerminalMockupState();
}

class _TerminalMockupState extends State<_TerminalMockup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _showCursor = !_showCursor;
          });
          _controller.forward(from: 0.0);
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
      decoration: BoxDecoration(
        color: const Color(0xff1E1E1E),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15.r,
            offset: Offset(0, 8.h),
          )
        ],
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _Dot(color: Colors.red),
              SizedBox(width: 6.w),
              _Dot(color: Colors.amber),
              SizedBox(width: 6.w),
              _Dot(color: Colors.green),
            ],
          ),
          SizedBox(height: 20.h),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12.sp,
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text: r'abdullah$ ',
                  style: TextStyle(color: Colors.greenAccent),
                ),
                const TextSpan(
                  text: "execute_ai_flow\n",
                  style: TextStyle(color: Colors.white),
                ),
                const TextSpan(
                  text: "[System] Booting Agent pipelines...\n",
                  style: TextStyle(color: Colors.white70),
                ),
                const TextSpan(
                  text: "[Success] APIs Connected & Listening\n",
                  style: TextStyle(color: AppColors.success),
                ),
                TextSpan(
                  text: r'abdullah$ _',
                  style: TextStyle(
                    color: _showCursor ? Colors.white : Colors.transparent,
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

class _Dot extends StatelessWidget {
  const _Dot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.r,
      height: 8.r,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ToolsTray extends StatelessWidget {
  const _ToolsTray();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 950;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40.w : 24.w,
        vertical: 32.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.01),
            blurRadius: 15.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tools & Workflow",
                  style: AppTextStyles.h3.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Row(
                  children: const [
                    _ToolsBadge(label: 'GitHub'),
                    SizedBox(width: 16),
                    _ToolsBadge(label: 'Figma'),
                    SizedBox(width: 16),
                    _ToolsBadge(label: 'VS Code'),
                    SizedBox(width: 16),
                    _ToolsBadge(label: 'Postman'),
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Tools & Workflow",
                  style: AppTextStyles.h3.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 24.h),
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  alignment: WrapAlignment.center,
                  children: const [
                    _ToolsBadge(label: 'Git'),
                    _ToolsBadge(label: 'GitHub'),
                    _ToolsBadge(label: 'Figma'),
                    _ToolsBadge(label: 'VS Code'),
                  ],
                ),
              ],
            ),
    );
  }
}

class _ToolsBadge extends StatefulWidget {
  const _ToolsBadge({required this.label});

  final String label;

  @override
  State<_ToolsBadge> createState() => _ToolsBadgeState();
}

class _ToolsBadgeState extends State<_ToolsBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovered ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: _isHovered ? AppColors.primary : AppColors.border,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppColors.primary.withOpacity(0.1),
                      blurRadius: 10.r,
                      offset: Offset(0, 4.h),
                    )
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: _isHovered ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.subtitle,
    required this.title,
    required this.description,
  });

  final String subtitle;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: AppTextStyles.h3.copyWith(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          description,
          style: AppTextStyles.body.copyWith(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _SkillTag extends StatelessWidget {
  const _SkillTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
