import 'package:abdullah_portfolio/core/theme/app_gradients.dart';
import 'package:abdullah_portfolio/features/hero/screens/hero_section.dart';
import 'package:abdullah_portfolio/features/home/widgets/contact_section.dart';
import 'package:abdullah_portfolio/features/home/widgets/mobile_drawer.dart';
import 'package:abdullah_portfolio/features/home/widgets/project_cta_section.dart';
import 'package:abdullah_portfolio/features/home/widgets/responsive_nav_bar.dart';
import 'package:abdullah_portfolio/features/home/widgets/what_i_do_section.dart';
import 'package:abdullah_portfolio/features/portfolio/screen/portfolio_section.dart';
import 'package:abdullah_portfolio/features/process/screen/process_section.dart';
import 'package:abdullah_portfolio/features/skills/screen/skills_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.hero,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
              titleSpacing: 0,
              toolbarHeight: 80.h,
              title: const ResponsiveNavBar(),
            ),
            const SliverToBoxAdapter(
              child: HeroSection(),
            ),
            const SliverToBoxAdapter(
              child: SkillsSection(),
            ),
            const SliverToBoxAdapter(
              child: WhatIDoSection(),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 242, 243, 244),
                ),
                child: const ProcessSection(),
              ),
            ),
            const SliverToBoxAdapter(
              child: PortfolioSection(),
            ),
            const SliverToBoxAdapter(
              child: ProjectCtaSection(),
            ),
            const SliverToBoxAdapter(
              child: ContactSection(),
            ),
          ],
        ),
      ),
    );
  }
}
