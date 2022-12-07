part of '../home_page.dart';

class _HomePageContent extends StatelessWidget {
  const _HomePageContent({
    Key? key,
  }) : super(key: key);

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
        PageLayout pageLayout = context.read<CoreCubit>().state.pageLayout;
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16 + 8 * pageLayout.flex.toDouble(), vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (ContentList.pages[index].showTitle)
                _SectionTitle(
                  title: ContentList.pages[index].title,
                  crossAxisAlignment:
                      context.read<CoreCubit>().state.pageLayout.pageType ==
                              PageWidthType.wide
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                ),
              ContentList.pages[index].content,
            ],
          ),
        );
      },
    );
  }
}
