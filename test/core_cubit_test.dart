import 'package:bloc_test/bloc_test.dart';
import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  late CoreCubit sut;

  setUp(
    () {
      sut = CoreCubit();
    },
  );

  group('setScaleFactor', () {
    blocTest(
      'emits pageLayout: pageLayout',
      build: () => sut,
      act: (cubit) => cubit.setScaleFactor(PageLayout.narrow1),
      expect: () => CoreState(
          itemScrollController: ItemScrollController(),
          itemPositionsListener: ItemPositionsListener.create(),
          pageLayout: PageLayout.narrow1),
    );
  });
}
