import 'dart:math';

import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/pages/sections/shared/indent_span.dart';
import 'package:cv/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'start_column.dart';
part 'start_photo.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                    (coreState.windowHeight - 712) *
                        coreState.pageLayout.textScale,
                    0)),
          ],
        );
      },
    );
  }
}
