import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/pages/home/widgets/home_app_bar.dart';
import 'package:cv/pages/home/widgets/navigation_drawer.dart';
import 'package:cv/pages/home/widgets/home_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (coreState.pageLayout.pageType == PageWidthType.wide) ...[
              const NavigationDrawer(isDrawer: false),
            ],
            if (coreState.pageLayout.flex > 0)
              Spacer(flex: coreState.pageLayout.flex),
            const Expanded(
              flex: 100,
              child: HomePageContent(),
            ),
            if (coreState.pageLayout.flex > 0)
              Spacer(flex: coreState.pageLayout.flex),
            if (coreState.pageLayout.pageType == PageWidthType.wide) ...[
              const RotatedBox(
                quarterTurns: -1,
                child: HomeAppBar(rotated: true),
              ),
            ],
          ],
        );
      },
    );
  }
}
