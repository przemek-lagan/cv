import 'package:cv/home/pages/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Column(
      children: [
        PageTitle(title: t!.education_title),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(flex: 1),
            1: FlexColumnWidth(4),
          },
          children: [
            TableRow(
              children: [
                const TableCell1(text: '2000 ÷ 2005'),
                Row(
                  children: [
                    TableCell1(text: t.education2_title, bold: true),
                    TableCell1(text: ' ${t.education2_title_secondary}'),
                  ],
                ),
              ],
            ),
            TableRow(children: [const SizedBox(height: 4), Container()]),
            TableRow(
              children: [
                Container(),
                TableCell1(text: t.education2_field),
              ],
            ),
            TableRow(children: [const SizedBox(height: 4), Container()]),
            TableRow(
              children: [
                Container(),
                TableCell1(text: t.education2_specialty),
              ],
            ),
            TableRow(children: [const SizedBox(height: 4), Container()]),
            TableRow(
              children: [
                Container(),
                TableCell1(text: t.education2_degree),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
