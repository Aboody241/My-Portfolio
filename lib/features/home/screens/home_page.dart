import 'package:abdullah_portfolio/core/theme/app_gradients.dart';
import 'package:abdullah_portfolio/core/utils/file_downloader.dart';
import 'package:abdullah_portfolio/features/hero/screens/hero_section.dart';
import 'package:abdullah_portfolio/features/home/widgets/contact_section.dart';
import 'package:abdullah_portfolio/features/home/widgets/mobile_drawer.dart';
import 'package:abdullah_portfolio/features/home/widgets/project_cta_section.dart';
import 'package:abdullah_portfolio/features/home/widgets/responsive_nav_bar.dart';
import 'package:abdullah_portfolio/features/home/widgets/what_i_do_section.dart';
import 'package:abdullah_portfolio/features/portfolio/screen/portfolio_section.dart';
import 'package:abdullah_portfolio/features/skills/screen/skills_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _whatIDoKey = GlobalKey();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _onSectionSelected(String name) {
    if (name == 'Home' || name == 'About') {
      _scrollToSection(_heroKey);
    } else if (name == 'Skills') {
      _scrollToSection(_skillsKey);
    } else if (name == 'What I Do' || name == 'Services') {
      _scrollToSection(_whatIDoKey);
    } else if (name == 'How I Work' || name == 'Experience / Process') {
      _scrollToSection(_processKey);
    } else if (name == 'Projects' || name == 'Featured Projects' || name == 'Portfolio') {
      _scrollToSection(_portfolioKey);
    } else if (name == 'Contact') {
      _scrollToSection(_contactKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MobileDrawer(onSectionSelected: _onSectionSelected),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.hero,
        ),
        child: CustomScrollView(
          cacheExtent: 9999.0, // ensures all sliver GlobalKeys contexts remain valid in tree
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
              titleSpacing: 0,
              toolbarHeight: 80.h,
              title: ResponsiveNavBar(onSectionSelected: _onSectionSelected),
            ),
            SliverToBoxAdapter(
              child: HeroSection(
                key: _heroKey,
                onViewProjectsTap: () => _scrollToSection(_portfolioKey),
                onDownloadCvTap: () {
                  downloadFile('Abdullah_Essam_CV.pdf', 'Abdullah_Essam_CV.pdf');
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SkillsSection(key: _skillsKey),
            ),
            SliverToBoxAdapter(
              child: WhatIDoSection(
                key: _whatIDoKey,
                onContactTap: () => _scrollToSection(_contactKey),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     key: _processKey,
            //     decoration: const BoxDecoration(
            //       color: AppColors.background,
            //     ),
            //     child: const ProcessSection(),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: PortfolioSection(key: _portfolioKey),
            ),
            SliverToBoxAdapter(
              child: ProjectCtaSection(
                onConnectTap: () => _scrollToSection(_contactKey),
              ),
            ),
            SliverToBoxAdapter(
              child: ContactSection(key: _contactKey),
            ),
          ],
        ),
      ),
    );
  }
}
