import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/global.dart';
import 'package:cv/home/pages/shared_widgets/indent_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutColumn extends StatelessWidget {
  const AboutColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text.rich(
              textAlign: TextAlign.justify,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Cześć, jestem Przemek',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withBlue(150),
                        fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: '\n'),
                  WidgetSpan(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 4 * coreState.scaleFactor.value),
                      child: Text.rich(
                          textScaleFactor: coreState.scaleFactor.correctionValue,
                          const TextSpan(
                              text: 'Początkujący Flutter Developer')),
                    ),
                  ),
                  // const TextSpan(text: 'Początkujący Flutter Developer'),
                  const TextSpan(text: '\n\n'),
                  indentSpan(coreState.scaleFactor),
                  const TextSpan(
                      text: 'Od wielu lat moim głównym hobby jest nauka nowych '
                          'języków programowania i tworzenie progamów na '
                          'własne potrzeby, a od marca 2022 zajmuję się '
                          'przede wszystkim Flutterem.'),
                  const TextSpan(text: '\n'),
                  indentSpan(coreState.scaleFactor),
                  const TextSpan(
                      text:
                          'W wolnych chwilach jeżdżę na rolkach, próbuję grać '
                          'na pianinie, słucham krasnoludzkiego'
                          ' power metalu i tworzę rymy niskich lotów.'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
