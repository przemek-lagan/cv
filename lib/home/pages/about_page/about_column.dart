import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/shared_widgets/indent_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutColumn extends StatelessWidget {
  const AboutColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
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
                    text: t!.about_hi,
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
                          textScaleFactor:
                              coreState.scaleFactor.correctionValue,
                          TextSpan(text: t.about_my_title)),
                    ),
                  ),
                  // const TextSpan(text: 'Początkujący Flutter Developer'),
                  const TextSpan(text: '\n\n'),
                  indentSpan(coreState.scaleFactor),
                  TextSpan(text: t.about_info1),
                  const TextSpan(text: '\n'),
                  indentSpan(coreState.scaleFactor),
                  TextSpan(text: t.about_info2),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
