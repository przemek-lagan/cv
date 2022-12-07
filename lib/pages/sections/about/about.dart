import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/pages/sections/shared/indent_span.dart';
import 'package:cv/pages/sections/shared/tooltip_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'about_expandable.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  indentSpan(coreState.pageLayout),
                  TextSpan(text: t!.about_info1),
                  tooltipSpan(
                    context: context,
                    text: t.about_info1_tooltip_body,
                    child: Text.rich(
                      style: Theme.of(context).textTheme.bodyText1,
                      TextSpan(text: t.about_info1_tooltip_message),
                    ),
                    textStyle: Theme.of(context).textTheme.bodyText1!,
                  ),
                  const TextSpan(text: '.'),
                  const WidgetSpan(child: Text('')),
                  // TODO
                  indentSpan(coreState.pageLayout),
                  TextSpan(
                    text: t.about_info2,
                  ),
                  const TextSpan(text: '\n\n'),
                  indentSpan(coreState.pageLayout),
                  TextSpan(
                    text: t.about_info3,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
