// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_cubit.dart';

class CoreState {
  final ThemeMode? themeMode;
  final bool en;
  final PageLayout pageLayout;
  final ItemScrollController? itemScrollController;
  final ItemPositionsListener? itemPositionsListener;
  final List<int> visiblePages;
  final int activePageIndex;
  // final List places;
  // final PageController? pageController;

  CoreState({
    this.themeMode,
    this.en = false,
    this.pageLayout = PageLayout.standard,
    this.itemScrollController,
    this.itemPositionsListener,
    this.visiblePages=const[],
    this.activePageIndex = 0,
    // this.places = const [],
    // this.pageController,
  });

  CoreState copyWith({
    ThemeMode? themeMode,
    bool? en,
    PageLayout? pageLayout,
    ItemScrollController? itemScrollController,
    ItemPositionsListener? itemPositionsListener,
    List<int>? visiblePages,
    int? activePageIndex,
  }) {
    return CoreState(
      themeMode: themeMode ?? this.themeMode,
      en: en ?? this.en,
      pageLayout: pageLayout ?? this.pageLayout,
      itemScrollController: itemScrollController ?? this.itemScrollController,
      itemPositionsListener: itemPositionsListener ?? this.itemPositionsListener,
      visiblePages: visiblePages ?? this.visiblePages,
      activePageIndex: activePageIndex ?? this.activePageIndex,
    );
  }
}
