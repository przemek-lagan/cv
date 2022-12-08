import 'dart:math';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            t!.projects_1_title,
                            style: Theme.of(context).textTheme.startTitle,
                          ),
                          const SizedBox(height: 32),
                          Align(
                            // alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).primaryColor),
                              ),
                              onPressed: null,
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(t.projects_1_button),
                              ),
                              icon: const Icon(CarbonIcons.logo_github),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32 * coreState.pageLayout.textScale),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Bajlaga',
                            style: Theme.of(context).textTheme.startTitle,
                          ),
                          const SizedBox(height: 16),
                          Text(t.projects_2_descritpion1,
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(t.projects_2_descritpion2,
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 16),
                          Align(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
