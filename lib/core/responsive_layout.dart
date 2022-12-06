import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/home/pages/no_space_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget narrow;
  final Widget standard;
  // final Widget wide;
  const ResponsiveLayout({
    super.key,
    required this.narrow,
    required this.standard,
    // required this.wide,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        // print(width);
        // if (width > 1200) {
        //   return wide;
        // }
        PageLayout pageLayout;
        if (width < 400) {
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
        context.read<CoreCubit>().setScaleFactor(pageLayout);
        if (width < 250 || height < 350) {
          return const NoSpaceWarning();
          // return NoSpaceWarning('Width: $width, height: $height');
        }
        if (width <= 1000) {
          return narrow;
        }
        return standard;
      },
    );
  }
}
