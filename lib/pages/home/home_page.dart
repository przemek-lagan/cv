import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/contact_list.dart';
import 'package:cv/globals/content_list.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/pages/home/widgets/no_space_warning.dart';
import 'package:cv/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'widgets/home_app_bar.dart';
part 'widgets/home_page_body.dart';
part 'widgets/home_page_content.dart';
part 'widgets/navigation_drawer.dart';
part 'widgets/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContentList.init(context);
    ContactList.init(context);
    context.read<CoreCubit>().initializeTheme(context);
    var t = AppLocalizations.of(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      context.read<CoreCubit>().setPageLayout(constraints);
      return BlocBuilder<CoreCubit, CoreState>(
        builder: (context, coreState) {
          return coreState.pageLayout.pageType == PageWidthType.tooSmall
              ? const NoSpaceWarning()
              :  Scaffold(
                      appBar: coreState.pageLayout.pageType ==
                              PageWidthType.standard
                          ? const _HomeAppBar()
                          : null,
                      drawer: coreState.pageLayout.pageType ==
                              PageWidthType.standard
                          ? const Drawer(
                              child: _NavigationDrawer(),
                            )
                          : null,
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.endFloat,
                      floatingActionButton:
                          coreState.pageLayout.pageType == PageWidthType.wide
                              ? null
                              : SpeedDial(
                                  tooltip: t!.fab_tooltip,
                                  icon: Icons.phone_outlined,
                                  activeIcon: Icons.close,
                                  children: ContactList.fabActions,
                                  spacing: 16,
                                  childPadding: const EdgeInsets.all(8),
                                  childrenButtonSize: const Size(66.0, 66.0),
                                ),
                      body: const _HomePageBody(),
                    );
        },
      );
    });
  }
}
