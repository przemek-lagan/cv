// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'core_cubit.dart';

class CoreState {
  final ThemeMode? themeMode; 
  final bool en;
  CoreState({
    this.themeMode,
    this.en = false,
  });

  CoreState copyWith({
    ThemeMode? themeMode,
    bool? en,
  }) {
    return CoreState(
      themeMode: themeMode ?? this.themeMode,
      en: en ?? this.en,
    );
  }
}
