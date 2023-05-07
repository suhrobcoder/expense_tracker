import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/presentation/pages/home/home_page.dart';
import 'package:expense_tracker/presentation/pages/main/bloc/main_bloc.dart';
import 'package:expense_tracker/presentation/pages/statistics/statistics_page.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainBloc>(),
      child: Scaffold(
        body: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return SizedBox.expand(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned.fill(
                    bottom: 64,
                    child: IndexedStack(
                      index: state.currentPage,
                      children: const [
                        HomePage(),
                        StatisticsPage(),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          color: Colors.black12,
                          height: 1.0,
                          width: double.infinity),
                      const SizedBox(height: 7.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(width: defaultPadding),
                          BottomNavItem(
                              icon: "assets/icons/home.svg",
                              selected: state.currentPage == 0,
                              onTap: () => context
                                  .read<MainBloc>()
                                  .add(const SelectPageEvent(0))),
                          BottomNavItem(
                              icon: "assets/icons/statistics.svg",
                              selected: state.currentPage == 1,
                              onTap: () => context
                                  .read<MainBloc>()
                                  .add(const SelectPageEvent(1))),
                          const SizedBox(width: 96),
                          BottomNavItem(
                              icon: "assets/icons/wallet.svg",
                              selected: state.currentPage == 2,
                              onTap: () => context
                                  .read<MainBloc>()
                                  .add(const SelectPageEvent(2))),
                          BottomNavItem(
                              icon: "assets/icons/settings.svg",
                              selected: state.currentPage == 3,
                              onTap: () => context
                                  .read<MainBloc>()
                                  .add(const SelectPageEvent(3))),
                          const SizedBox(width: defaultPadding),
                        ],
                      ),
                      const SizedBox(height: 8)
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: darkGrey,
                      ),
                      child: const Icon(Icons.add_rounded,
                          color: Colors.white, size: 48),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String icon;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      radius: 12,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? colorScheme.primary : Colors.transparent,
        ),
        child: SvgPicture.asset(icon, width: 32, height: 32),
      ),
    );
  }
}
