import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/global.dart';
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
        ScaleFactor scaleFactor;
        if (width < 800) {
          scaleFactor = ScaleFactor.standard;
        } else if (width < 1000) {
          scaleFactor = ScaleFactor.zoom10;
        } else if (width < 1200) {
          scaleFactor = ScaleFactor.zoom20;
        } else if (width < 1400) {
          scaleFactor = ScaleFactor.zoom30;
        } else {
          scaleFactor = ScaleFactor.zoom40;
        }
        context.read<CoreCubit>().setScaleFactor(scaleFactor);
        if (width < 300 || height < 350) {
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
