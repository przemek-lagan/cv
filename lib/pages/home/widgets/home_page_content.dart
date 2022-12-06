import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/content_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    int initialScrollIndex = 0;
    List<int> visiblePages = context.read<CoreCubit>().state.visiblePages;
    if (visiblePages.isNotEmpty) initialScrollIndex = visiblePages[0];
    return ScrollablePositionedList.builder(
      initialScrollIndex: initialScrollIndex,
      shrinkWrap: true,
      itemCount: ContentList.pages.length,
      itemScrollController:
          context.read<CoreCubit>().state.itemScrollController,
      itemPositionsListener:
          context.read<CoreCubit>().state.itemPositionsListener,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ContentList.pages[index].content,
            const SizedBox(
              height: 200,
            ),
          ],
        );
      },
    );
  }
}
