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
                  ProjectCard(
                    t!.projects_1_title,
                    badge: 'project1',
                    repositoryUrl: t.project_1_repository_link,
                  ),
                  SizedBox(height: 32 * coreState.pageLayout.textScale),
                  ProjectCard(
                    "Bajlaga",
                    badge: 'project2',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.projects_2_descritpion1,
                            style: Theme.of(context).textTheme.bodyText1),
                        Text(t.projects_2_descritpion2,
                            style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(height: 16),
                        Align(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor),
                            ),
                            onPressed: null,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(t.projects_2_demo_info),
                            ),
                          ),
                        ),
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

class ProjectCard extends StatelessWidget {
  final String title;
  final String? badge;
  final String? repositoryUrl;
  final String? appUrl;
  final Widget? child;
  const ProjectCard(
    this.title, {
    this.badge,
    this.repositoryUrl,
    this.appUrl,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.startTitle,
                ),
                if (child != null) ...[
                  const SizedBox(height: 16),
                  child!,
                ],
                if (repositoryUrl != null || appUrl != null)
                  const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (repositoryUrl != null)
                      _RepositoryButton(repositoryUrl!),
                    if (repositoryUrl != null && appUrl != null)
                      const SizedBox(width: 16),
                    if (appUrl != null) _AppButton(appUrl!),
                  ],
                )
              ],
            ),
            if (badge != null)
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/badges/$badge.png',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
