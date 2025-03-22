import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/presentation/pages/main/cubit/mall_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/constant/app_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        color: (state.isMarket)
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: DefaultTabController(
            initialIndex: state.index,
            length: MallType.values.length,
            child: TabBar(
              onTap: (index) =>
                  context.read<MallTypeCubit>().changeIndex(index),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: List.generate(
                MallType.values.length,
                (index) => Tab(
                  text: MallType.values[index].toName,
                ),
              ),
            ),
          ),
          leadingWidth: 86,
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.location,
                colorFilter: ColorFilter.mode(
                  state.isMarket
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.contentPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.cart,
                colorFilter: ColorFilter.mode(
                  state.isMarket
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.contentPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
