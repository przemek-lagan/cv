import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/global.dart';
import 'package:cv/home/pages/shared_widgets.dart';
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
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        MediaQueryData windowData =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .copyWith(textScaleFactor: coreState.scaleFactor.value);
        return MediaQuery(
          data: windowData,
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 600),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: Listener(
                onPointerSignal: Global.isMobile
                    ? null
                    : (pointerSignal) {
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
                // onPointerMove: !Global.isMobile
                //     ? (PointerMoveEvent event) {
                //         if (event.delta.dx > 0) {
                //           pageController.previousPage(
                //               duration: scrollDuration, curve: scrollCurve);
                //         } else {
                //           pageController.nextPage(
                //               duration: scrollDuration, curve: scrollCurve);
                //         }
                //       }
                //     : null,
                child: PageView(
                  // physics: const NeverScrollableScrollPhysics(),
                  padEnds: false,
                  pageSnapping: true,

                  // beha
                  onPageChanged: (index) =>
                      context.read<CoreCubit>().changeActivePageIndex(index),
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: Global.pages.asMap().entries.map((page) {
                    return Column(
                      children: [
                        PageTitle(title: Global.titles[page.key]),
                        Expanded(
                            child: SingleChildScrollView(child: page.value)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
