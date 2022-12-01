import 'package:cv/home/pages/no_space_warning.dart';
import 'package:flutter/material.dart';

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
        // if (width > 1200) {
        //   return wide;
        // }
        if (width < 400 || height < 350) return const NoSpaceWarning();
        if (width > 800) {
          return standard;
        }
        return narrow;
      },
    );
  }
}
