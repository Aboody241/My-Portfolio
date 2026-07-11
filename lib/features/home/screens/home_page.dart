import 'package:abdullah_portfolio/core/theme/colors.dart';
import 'package:abdullah_portfolio/features/home/widgets/mobile_drawer.dart';
import 'package:abdullah_portfolio/features/home/widgets/responsive_nav_bar.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            backgroundColor: AppColors.background,
            titleSpacing: 0,
            toolbarHeight: 80.h,
            title: const ResponsiveNavBar(),
          ),
        ],
      ),
    );
  }
}
