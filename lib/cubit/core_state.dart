// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_cubit.dart';

class CoreState {
  final ThemeMode? themeMode;
  final bool en;
  final int activePageIndex;
  final List places;
  final PageController? pageController;
  final ScaleFactor scaleFactor;

  CoreState({
    this.themeMode,
    this.en = false,
    this.activePageIndex = 0,
    this.places = const [],
    this.pageController,
    this.scaleFactor=ScaleFactor.standard,
  });

  CoreState copyWith({
    ThemeMode? themeMode,
    bool? en,
    int? activePageIndex,
    List? places,
    PageController? pageController,
    ScaleFactor? scaleFactor,
  }) {
    return CoreState(
      themeMode: themeMode ?? this.themeMode,
      en: en ?? this.en,
      activePageIndex: activePageIndex ?? this.activePageIndex,
      places: places ?? this.places,
      pageController: pageController ?? this.pageController,
      scaleFactor: scaleFactor ?? this.scaleFactor,
    );
  }
}
