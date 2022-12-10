part of 'core_cubit.dart';

class CoreState {
  final ThemeMode? themeMode;
  final bool gb;
  final PageLayout pageLayout;
  final ItemScrollController? itemScrollController;
  final ItemPositionsListener? itemPositionsListener;
  final List<int> visiblePages;

  final double windowHeight;

  final bool subpageActive;
  final Widget? activeSubpage;

  CoreState({
    this.themeMode,
    this.gb = false,
    this.pageLayout = PageLayout.standard,
    this.itemScrollController,
    this.itemPositionsListener,
    this.visiblePages = const [],
    this.windowHeight = 0,
    this.subpageActive = false,
    this.activeSubpage,
  });

  CoreState copyWith({
    ThemeMode? themeMode,
    bool? gb,
    PageLayout? pageLayout,
    ItemScrollController? itemScrollController,
    ItemPositionsListener? itemPositionsListener,
    List<int>? visiblePages,
    double? windowHeight,
    bool? subpageActive,
    Widget? activeSubpage,
  }) {
    return CoreState(
      themeMode: themeMode ?? this.themeMode,
      gb: gb ?? this.gb,
      pageLayout: pageLayout ?? this.pageLayout,
      itemScrollController: itemScrollController ?? this.itemScrollController,
      itemPositionsListener:
          itemPositionsListener ?? this.itemPositionsListener,
      visiblePages: visiblePages ?? this.visiblePages,
      windowHeight: windowHeight ?? this.windowHeight,
      subpageActive: subpageActive ?? this.subpageActive,
      activeSubpage: activeSubpage ?? this.activeSubpage,
    );
  }
}
