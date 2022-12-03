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
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(flex: 1),
            1: FlexColumnWidth(4),
          },
          children: [
            const TableRow(
              children: [
                TableCell1(text: '2022'),
                TableCell1(text: "Kurs fluttera"),
              ],
            ),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            const TableRow(
              children: [
                SizedBox(),
                TableCell1(text: 'Którego żem nawet nie skończył...'),
              ],
            ),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            const TableRow(
              children: [
                SizedBox(),
                TableCell1(
                    text:
                        'I utknąwszy gdzieś w lesie, nie dotarł nawet do testów.'),
              ],
            ),
            const TableRow(children: [SizedBox(height: 32), SizedBox()]),
            TableRow(
              children: [
                const TableCell1(text: '2000 ÷ 2005'),
                Row(
                  children: [
                    TableCell1(text: t!.education2_title, bold: true),
                    TableCell1(text: ' ${t.education2_title_secondary}'),
                  ],
                ),
              ],
            ),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            TableRow(
              children: [
                const SizedBox(),
                TableCell1(text: t.education2_field),
              ],
            ),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            TableRow(
              children: [
                const SizedBox(),
                TableCell1(text: t.education2_specialty),
              ],
            ),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            TableRow(
              children: [
                const SizedBox(),
                TableCell1(text: t.education2_degree),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
