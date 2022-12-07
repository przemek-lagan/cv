import 'dart:math';

import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/pages/sections/shared/indent.dart';
import 'package:cv/pages/sections/shared/tooltip_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'about_expandable.dart';

class About extends StatelessWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: coreState.pageLayout.flex.toDouble() * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                // textAlign: TextAlign.justify,
                TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    indentSpan(coreState.pageLayout),
                    TextSpan(text: t!.about_info1),
                    tooltipSpan(
                      context: context,
                      child: t.about_info1_tooltip_body,
                      tooltip: Text.rich(
                        style: Theme.of(context).textTheme.bodyText1,
                        TextSpan(text: t.about_info1_tooltip_message),
                      ),
                      textStyle: Theme.of(context).textTheme.bodyText1!,
                    ),
                    const TextSpan(text: '.\n'),
                    //
                    WidgetSpan(
                        child: _AboutExpandable(
                      pageLayout: coreState.pageLayout,
                    )),
                    const TextSpan(text: '\n'),
                    indentSpan(coreState.pageLayout),
                    TextSpan(
                      text: t.about_info2,
                    ),
                    const TextSpan(text: '\n\n\n'),
                    indentSpan(coreState.pageLayout),
                    TextSpan(
                      text: t.about_info3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: max(
                      (coreState.windowHeight - 600) *
                              coreState.pageLayout.textScale +
                          coreState.pageLayout.flex * 10,
                      0)),
            ],
          ),
        );
      },
    );
  }
}
