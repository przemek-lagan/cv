import 'package:cv/home/pages/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Column(
      children: [
        PageTitle(title: t!.work_title),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          columnWidths: const {
            0: IntrinsicColumnWidth(flex: 1),
            1: FlexColumnWidth(4),
          },
          children: [
            TableRow(
              children: [
                TableCell1(text: t.work2_date1),
                Row(
                  children: [
                    TableCell1(text: t.work2_title, bold: true),
                  ],
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell1(text: t.work2_date2),
                Row(
                  children: [
                    Flexible(child: TableCell1(text: t.work2_resp1)),
                  ],
                ),
              ],
            ),
            TableRow(children: [
              Container(),
              TableCell2Bullet(text: t.work2_resp2),
            ]),
            TableRow(children: [
              Container(),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: () {},
                    child: TableCell1(
                      text: t.work2_resp2a,
                    )),
              )
            ]),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: IntrinsicColumnWidth(flex: 1),
            1: FlexColumnWidth(4),
          },
          children: [
            TableRow(
              children: [
                TableCell1(text: t.work1_date1),
                Row(
                  children: [
                    TableCell1(text: t.work1_title, bold: true),
                  ],
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell1(text: t.work1_date2),
                Row(
                  children: [
                    TableCell1(text: t.work1_role),
                  ],
                ),
              ],
            ),
            TableRow(children: [const SizedBox(height: 8), Container()]),
            TableRow(
              children: [
                Container(),
                Row(
                  children: [
                    TableCell1(text: t.work1_resp),
                  ],
                ),
              ],
            ),
            TableRow(children: [
              Container(),
              TableCell2Bullet(text: t.work1_resp1),
            ]),
            TableRow(children: [
              Container(),
              TableCell2Bullet(text: t.work1_resp2),
            ]),
            TableRow(children: [
              Container(),
              TableCell2Bullet(text: t.work1_resp3),
            ]),
            TableRow(children: [
              Container(),
              TableCell2Bullet(text: t.work1_resp4),
            ]),
          ],
        ),
      ],
    );
  }
}
