import 'package:cv/core/responsive_layout.dart';
import 'package:cv/home/pages/global.dart';
import 'package:cv/home/widgets/contact_actions.dart';
import 'package:cv/home/widgets/home_app_bar.dart';
import 'package:cv/home/widgets/home_page_body.dart';
import 'package:cv/home/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/core_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageList.init(context);
    return const ResponsiveLayout(
      narrow: HomePageNarrow(),
      standard: HomePageStandard(),
    );
  }
}

class HomePageNarrow extends StatelessWidget {
  const HomePageNarrow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        final PageController pageController =
            PageController(initialPage: coreState.activePageIndex);

        return Scaffold(
          appBar: const HomeAppBar(),
          bottomNavigationBar: BottomAppBar(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [ContactActions()],
          )),
          drawer: Drawer(
            child: NavigationDrawer(
              key: const Key('drawer'),
              controller: pageController,
            ),
          ),
          body: Center(
            child: HomePageBody(
              key: const Key('body'),
              pageController: pageController,
            ),
          ),
        );
      },
    );
  }
}

class HomePageStandard extends StatelessWidget {
  const HomePageStandard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        final PageController pageController =
            PageController(initialPage: coreState.activePageIndex);
        return Scaffold(
          body: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              NavigationDrawer(
                key: const Key('drawer'),
                controller: pageController,
                isDrawer: false,
              ),
              Expanded(
                  child: HomePageBody(
                pageController: pageController,
                key: const Key('body'),
              )),
              const RotatedBox(
                quarterTurns: 1,
                child: HomeAppBar(rotated: true),
              )
            ],
          ),
        );
      },
    );
  }
}
