import 'package:bloc/bloc.dart';
import 'package:cv/globals/content_list.dart';
import 'package:cv/globals/enums.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit()
      : super(CoreState(
          itemScrollController: ItemScrollController(),
          itemPositionsListener: ItemPositionsListener.create(),
        ));

  void init() {
    state.itemPositionsListener!.itemPositions.addListener(() {
      Iterable<ItemPosition> positions =
          state.itemPositionsListener!.itemPositions.value;
      List<int> visiblePages = [];
      for (ItemPosition position in positions) {
        if ((position.itemLeadingEdge < 0.5 &&
                (position.itemLeadingEdge >= 0 ||
                    position.itemTrailingEdge > 0.5)) ||
            (position.itemLeadingEdge > 0.5 && position.itemTrailingEdge < 1) ||
            (position.index == ContentList.pages.length - 1 &&
                position.itemTrailingEdge == 1)) {
          visiblePages.add(position.index);
          emit(state.copyWith(visiblePages: visiblePages));
        }
      }
    });
  }

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

  Future<void> setPageLayout(BoxConstraints constraints) async {
    final double width = constraints.maxWidth;
    final double height = constraints.maxHeight;
    PageLayout pageLayout;

    if (width < 250 || height < 350) {
      pageLayout = PageLayout.tooSmall;
    } else if (width < 400) {
      pageLayout = PageLayout.narrow4;
    } else if (width < 500) {
      pageLayout = PageLayout.narrow3;
    } else if (width < 600) {
      pageLayout = PageLayout.narrow2;
    } else if (width < 700) {
      pageLayout = PageLayout.narrow1;
    } else if (width < 800) {
      pageLayout = PageLayout.standard;
    } else if (width < 1000) {
      pageLayout = PageLayout.wide1;
    } else if (width < 1200) {
      pageLayout = PageLayout.wide2;
    } else if (width < 1400) {
      pageLayout = PageLayout.wide3;
    } else {
      pageLayout = PageLayout.wide4;
    }
    emit(state.copyWith(pageLayout: pageLayout));
  }

  Future<void> changeActivePageIndex(int index) async {
    emit(state.copyWith(activePageIndex: index));
  }

  // Future<void> setPageController(PageController controller) async {
  //   emit(state.copyWith(pageController: controller));
  // }

  Future<void> setScaleFactor(PageLayout scaleFactor) async {
    emit(state.copyWith(pageLayout: scaleFactor));
  }
}
