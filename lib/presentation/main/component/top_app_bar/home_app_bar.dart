import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/mall_type_cubit.dart';
import 'widgets/svg_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          color: state.theme.backgroundColor,
          child: AppBar(
            leading: SvgIconButton(
              icon: AppIcons.mainLogo,
              color: state.theme.logoColor,
              padding: 8.0,
            ),
            title: AnimatedContainer(
              decoration: BoxDecoration(
                color: state.theme.containerColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: SizedBox(
                height: 28,
                child: DefaultTabController(
                  length: MallType.values.length,
                  initialIndex: state.index,
                  child: TabBar(
                    tabs: List.generate(
                      MallType.values.length,
                      (index) => Tab(text: MallType.values[index].toName),
                    ),
                    isScrollable: true,
                    indicator: BoxDecoration(
                      color: state.theme.indicatorColor,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: state.theme.labelColor,
                    labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                    unselectedLabelColor: state.theme.unselectedLabelColor,
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.labelLarge,
                    onTap: (index) =>
                        context.read<MallTypeCubit>().changeIndex(index),
                    splashBorderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              duration: Duration(microseconds: 400),
            ),
            actions: [
              _Actions(icon: AppIcons.location, state: state),
              _Actions(icon: AppIcons.cart, state: state),
            ],
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leadingWidth: 86,
          ),
          duration: Duration(
            microseconds: 800,
          ),
        );
      },
    );
  }
}

class _Actions extends StatelessWidget {
  final String icon;
  final MallType state;

  const _Actions({
    required this.icon,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          state.theme.iconColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
