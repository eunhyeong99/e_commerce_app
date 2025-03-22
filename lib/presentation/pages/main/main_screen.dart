import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/presentation/pages/category/category_page.dart';
import 'package:e_commerce_app/presentation/pages/home/components/home_page.dart';
import 'package:e_commerce_app/presentation/pages/main/components/top_app_bar/top_app_bar.dart';
import 'package:e_commerce_app/presentation/pages/main/cubit/bottom_nav_cubit.dart';
import 'package:e_commerce_app/presentation/pages/serach/search_page.dart';
import 'package:e_commerce_app/presentation/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: const MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          switch (state) {
            case BottomNav.home:
              return const HomePage();
            case BottomNav.category:
              return const CategoryPage();
            case BottomNav.search:
              return const SearchPage();
            case BottomNav.user:
              return const UserPage();
          }
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavCubit, BottomNav>(builder: (_, state) {
        return BottomNavigationBar(
          items: List.generate(
            BottomNav.values.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomNav.values[index].icon),
              activeIcon: SvgPicture.asset(BottomNav.values[index].activeIcon),
              label: BottomNav.values[index].toName,
            ),
          ),
          currentIndex: state.index,
          onTap: (index) => context.read<BottomNavCubit>().changeIndex(index),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
