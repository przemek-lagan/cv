import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

// List<Widget> skilsWidgets=skills.entries.map((e) => null)

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('projekts!!!!');

    skills.shuffle();
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        List<Widget> skillWidgetList = skills.map((e) {
          String name = e[0];
          int level = (e[1] as int).abs();
          bool fresh = e[1] > 0;
          bool important = e[2];
          return Text(
            '    $name',
            style: TextStyle(
              color: fresh
                  ? important
                      ? Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          // .withGreen(1)
                          .withBlue(50)
                          // .withRed(1)
                          .withOpacity(1 / 10 * level)
                      : Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withAlpha(180)
                  : Theme.of(context).disabledColor,
              fontWeight: level > 5 ? FontWeight.bold : null,
              fontSize: 8 + level * 2 * (important ? 1.3 : 1),
            ),
          );
        }).toList();
        return Scatter(
          alignment: Alignment.center,
          delegate: ArchimedeanSpiralScatterDelegate(
            // step: Random().nextInt(10) * 0.01,
            rotation: .5,
            ratio: 1.5 *
                coreState.pageLayout.value *
                coreState.pageLayout.widthfactor,
          ),
          fillGaps: true,
          children: skillWidgetList,
        );
      },
    );
  }
}
