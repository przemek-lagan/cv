import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/content_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    this.isDrawer = true,
    super.key,
  });
  final bool isDrawer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Container(
          color: Colors.blue.shade500.withOpacity(.15),
          width: 250,
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: [
              ...ContentList.pages
                  .map((page) => ListTile(
                        leading: page.icon,
                        selected: context
                            .read<CoreCubit>()
                            .state
                            .visiblePages
                            .contains(ContentList.pages.indexOf(page)),
                        title: Text(page.title),
                        onTap: () {
                          int targetIndex = ContentList.pages.indexOf(page);
                          int currentIndex = coreState.visiblePages[0];
                          int distance = (targetIndex - currentIndex).abs();
                          context
                              .read<CoreCubit>()
                              .state
                              .itemScrollController!
                              .scrollTo(
                                  index: targetIndex,
                                  duration:
                                      Duration(milliseconds: 300 * distance),
                                  curve: Curves.easeInCubic);
                          if (isDrawer) Navigator.of(context).pop();
                        },
                      ))
                  .toList(),
            ],
          ),
        );
      },
    );
  }
}
