import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/mall_type_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          color: (state.isMarket)
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AppIcons.mainLogo,
                colorFilter: ColorFilter.mode(
                  state.isMarket
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: DefaultTabController(
              length: MallType.values.length,
              initialIndex: state.index,
              child: TabBar(
                tabs: List.generate(
                  MallType.values.length,
                  (index) => Tab(
                    text: MallType.values[index].toName,
                  ),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                onTap: (index) =>
                    context.read<MallTypeCubit>().changeIndex(index),
              ),
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
          state.isMarket
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).colorScheme.contentPrimary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
