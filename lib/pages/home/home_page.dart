import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/content_list.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/home/pages/no_space_warning.dart';
import 'package:cv/home/widgets/contact_actions.dart';
import 'package:cv/pages/home/widgets/home_app_bar.dart';
import 'package:cv/pages/home/widgets/navigation_drawer.dart';
import 'package:cv/pages/home/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ContentList.init(context);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      context.read<CoreCubit>().setPageLayout(constraints);

      return BlocBuilder<CoreCubit, CoreState>(
        builder: (context, coreState) {
          return coreState.pageLayout.pageWidthType == PageWidthType.tooSmall
              ? const NoSpaceWarning()
              : Scaffold(
                  appBar: coreState.pageLayout.pageWidthType ==
                          PageWidthType.standard
                      ? const HomeAppBar()
                      : null,
                  bottomNavigationBar: coreState.pageLayout.pageWidthType ==
                          PageWidthType.standard
                      ? BottomAppBar(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [Spacer(), ContactActions()],
                          ),
                        )
                      : null,
                  drawer: coreState.pageLayout.pageWidthType ==
                          PageWidthType.standard
                      ? const Drawer(
                          child: NavigationDrawer(),
                        )
                      : null,
                  body: const HomePageBody(),
                );
        },
      );
    });
  }
}



