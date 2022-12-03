import 'package:bloc/bloc.dart';
import 'package:cv/home/pages/global.dart';
import 'package:flutter/material.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreState());

  Future<void> changeTheme(bool platformDarkMode,
      {ThemeMode? themeMode}) async {
    if (themeMode == null) {
      if (state.themeMode == null) {
        platformDarkMode
            ? themeMode = ThemeMode.light
            : themeMode = ThemeMode.dark;
      } else if (state.themeMode == ThemeMode.dark) {
        themeMode = ThemeMode.light;
      } else {
        themeMode = ThemeMode.dark;
      }
    }
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> switchLanguage() async {
    emit(state.copyWith(en: !state.en));
  }

  Future<void> changeActivePageIndex(int index) async {
    emit(state.copyWith(activePageIndex: index));
  }

  Future<void> setPageController(PageController controller) async {
    emit(state.copyWith(pageController: controller));
  }

  Future<void> setScaleFactor(ScaleFactor scaleFactor) async {
    emit(state.copyWith(scaleFactor: scaleFactor));
  }
}
