import 'dart:math';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/pages/sections/shared/indent.dart';
import 'package:cv/pages/sections/shared/tooltip_span.dart';
import 'package:cv/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

part 'skill_cloud.dart';
part 'skill_list.dart';

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    _skills.shuffle();

    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        TextStyle bodyText = Theme.of(context).textTheme.bodyText1!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SkillCloud(
              t: t,
              textScale: coreState.pageLayout.textScale,
            ),
            const SizedBox(height: 64),
            Align(
              alignment: coreState.pageLayout.pageType == PageWidthType.standard
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Text(
                t!.skills_lang_title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                indentWidget(coreState.pageLayout),
                Text(
                  '${t.skills_lang1_title}   -   ',
                  style: bodyText,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.skills_lang1_level,
                        style: bodyText,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '    -  ',
                            style: bodyText,
                          ),
                          Expanded(
                            child: Text(t.skills_lang1_cert1,
                                style: bodyText, softWrap: true),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor),
                          ),
                          onPressed: () {},
                          label: Text(t.skills_lang1_cert1_link_descritpion),
                          icon: const Icon(CarbonIcons.certificate),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '    -  ',
                            style: bodyText,
                          ),
                          Expanded(
                            child: Text(t.skills_lang1_cert2,
                                style: bodyText, softWrap: true),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 64),
            Align(
              alignment: coreState.pageLayout.pageType == PageWidthType.standard
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Text(
                t.skills_goals_title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Align(
              alignment: coreState.pageLayout.pageType == PageWidthType.standard
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Text(
                t.skills_goals_title2,
                style: bodyText,
              ),
            ),
            const SizedBox(height: 16),
            for (String goal in [
              t.skills_goals_goal1,
              t.skills_goals_goal2,
              t.skills_goals_goal3,
              t.skills_goals_goal4,
              t.skills_goals_goal5
            ].where((goal) => goal.isNotEmpty))
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  indentWidget(coreState.pageLayout),
                  Text(
                    '-  ',
                    style: bodyText,
                  ),
                  Text(goal, style: bodyText),
                ],
              ),
            SizedBox(
                height: max(
                    (coreState.windowHeight - 600) *
                            coreState.pageLayout.textScale +
                        coreState.pageLayout.flex * 10,
                    0)),
          ],
        );
      },
    );
  }
}
