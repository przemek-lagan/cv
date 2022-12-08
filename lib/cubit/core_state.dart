part of 'core_cubit.dart';

class CoreState {
  final ThemeMode? themeMode;
  final bool gb;
  final PageLayout pageLayout;
  final ItemScrollController? itemScrollController;
  final ItemPositionsListener? itemPositionsListener;
  final List<int> visiblePages;
  final int activePageIndex;
  final double windowHeight;

  CoreState({
    this.themeMode,
    this.gb = false,
    this.pageLayout = PageLayout.standard,
    this.itemScrollController,
    this.itemPositionsListener,
    this.visiblePages = const [],
    this.activePageIndex = 0,
    this.windowHeight = 0,
  });

  CoreState copyWith({
    ThemeMode? themeMode,
    bool? en,
    PageLayout? pageLayout,
    ItemScrollController? itemScrollController,
    ItemPositionsListener? itemPositionsListener,
    List<int>? visiblePages,
    int? activePageIndex,
    double? windowHeight,
  }) {
    return CoreState(
      themeMode: themeMode ?? this.themeMode,
      gb: en ?? gb,
      pageLayout: pageLayout ?? this.pageLayout,
      itemScrollController: itemScrollController ?? this.itemScrollController,
      itemPositionsListener:
          itemPositionsListener ?? this.itemPositionsListener,
      visiblePages: visiblePages ?? this.visiblePages,
      activePageIndex: activePageIndex ?? this.activePageIndex,
      windowHeight: windowHeight ?? this.windowHeight,
    );
  }
}
