import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/global.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;
  final Duration scrollDuration = const Duration(milliseconds: 200);
  final Curve scrollCurve = Curves.easeInOutCubic;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Listener(
          onPointerSignal: (pointerSignal) {
            if (pointerSignal is PointerScrollEvent) {
              if (pointerSignal.scrollDelta.dy > 0) {
                pageController.nextPage(
                    curve: scrollCurve, duration: scrollDuration);
              } else {
                pageController.previousPage(
                    duration: scrollDuration, curve: scrollCurve);
              }
            }
          },
          onPointerMove: (PointerMoveEvent event) {
            if (event.delta.dy > 0) {
              pageController.previousPage(
                  duration: scrollDuration, curve: scrollCurve);
            } else {
              pageController.nextPage(
                  duration: scrollDuration, curve: scrollCurve);
            }
          },
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            padEnds: false,
            pageSnapping: false,

            // beha
            onPageChanged: (index) =>
                context.read<CoreCubit>().changeActivePageIndex(index),
            controller: pageController,
            scrollDirection: Axis.vertical,
            children: PageList.pages,
          ),
        ),
      ),
    );
  }
}
