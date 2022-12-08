import 'dart:math';

import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/pages/sections/shared/indent.dart';
import 'package:cv/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:universal_html/html.dart' as html;

part 'start_column.dart';
part 'start_photo.dart';

class Start extends StatelessWidget {
  const Start({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            //   'https://wakatime.com/badge/user/4f2825b2-86df-4f0a-9df0-dc0ec3feead1/project/08687ad0-8111-487d-997d-f83ab08a2ff9.svg'
            if (coreState.pageLayout.pageType == PageWidthType.standard) ...[
              _StartPhoto(dark: coreState.themeMode == ThemeMode.dark),
              const SizedBox(height: 32),
              const _StartColumn(
                alignment: CrossAxisAlignment.center,
              )
            ],
            if (coreState.pageLayout.pageType == PageWidthType.wide) ...[
              Row(
                children: [
                  _StartPhoto(dark: coreState.themeMode == ThemeMode.dark),
                  const SizedBox(width: 32),
                  const Expanded(
                    child: _StartColumn(
                      alignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
              ),
            ],
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
