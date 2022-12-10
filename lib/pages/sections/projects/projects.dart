import 'dart:math';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'widgets/app_button.dart';
part 'widgets/repository_button.dart';
part 'widgets/gallery.dart';
part 'widgets/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        TextStyle bodyText = Theme.of(context).textTheme.bodyText1!;
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: coreState.pageLayout.flex.toDouble() * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ProjectCard(
                    t!.projects_1_title,
                    badge: 'project1',
                    repositoryUrl: t.project_1_repository_link,
                  ),
                  SizedBox(height: 32 * coreState.pageLayout.textScale),
                  _ProjectCard(
                    "Bajlaga",
                    badge: 'project2',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.projects_2_description1,
                            style: Theme.of(context).textTheme.bodyText1),
                        Text(t.projects_2_description2,
                            style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t.projects_2_description3,
                                style: Theme.of(context).textTheme.bodyText1),
                            Flexible(
                              child: Text(t.projects_2_description3a,
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor),
                          ),
                          onPressed: () async => await launchUrlString(
                              'https://www.youtube.com/watch?v=1Lcq2KbQbAs'),
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              t.projects_2_demo_info,
                              style: bodyText,
                            ),
                          ),
                          icon: const Icon(CarbonIcons.logo_youtube),
                        ),
                        const SizedBox(height: 16),
                        const _Gallery(path: 'project2', count: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64),
            Align(
              alignment: coreState.pageLayout.pageType == PageWidthType.standard
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Text(
                t.projects_rest_title1,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Align(
                alignment:
                    coreState.pageLayout.pageType == PageWidthType.standard
                        ? Alignment.center
                        : Alignment.centerLeft,
                child: Text(
                  t.projects_rest_title2,
                  style: bodyText,
                  textAlign:
                      coreState.pageLayout.pageType == PageWidthType.standard
                          ? TextAlign.center
                          : TextAlign.start,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Align(
                child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
              ),
              onPressed: null,
              label: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(t.projects_rest_info),
              ),
              icon: const Icon(
                CarbonIcons.construction,
                size: 30,
              ),
            )),
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
