// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_cubit.dart';

class CoreState {
  final ThemeMode? themeMode;
  final bool en;
  final int activePageIndex;

  CoreState({
    this.themeMode,
    this.en = false,
    this.activePageIndex=0,
  });

  CoreState copyWith({
    ThemeMode? themeMode,
    bool? en,
    int? activePageIndex,
  }) {
    return CoreState(
      themeMode: themeMode ?? this.themeMode,
      en: en ?? this.en,
      activePageIndex: activePageIndex ?? this.activePageIndex,
    );
  }
}
