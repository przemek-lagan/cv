import 'package:cv/home/pages/global.dart';
import 'package:cv/home/pages/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

List<dynamic> skills = [
  // [0] - name,
  // [1] - skill level (negative for old skills, needing some work to refresh)
  // [2] - is important for development?
  ['Flutter', 10, true],
  ['Dart', 8, true],
  ['BLoC (Cubit)', 9, true],
  ['Firebase', 9, true],
  ['Freezed', 7, true],
  ['Node.js', 3, true],
  ['Git', 8, true],
  ['iOS development', 3, true],
  ['CI/CD', 1, true],
  ['Python', -5, true],
  ['SQLite', -4, true],
  ['Visual Basic / VBA', -7, true],
  ['AutoCAD', 10, false],
  ['Lisp', -2, true],
  ['Google Apps Script', -2, true],
  ['Excel', 10, false],
  ['Google Sheets', 8, false],
  ['Sketchup 3D', -8, false]
];

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
    var t = AppLocalizations.of(context);
    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          columnWidths: const {
            0: IntrinsicColumnWidth(flex: 2),
            1: FlexColumnWidth(4),
          },
          children: [
            // languages
            TableRow(
              children: [
                TableCell1(text: t!.skills_lang_title, bold: true),
                const SizedBox(),
              ],
            ),
            const TableRow(children: [
              SizedBox(height: 8),
              SizedBox(),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: TableCell1(text: t.skills_lang1_title),
              ),
              TableCell1(text: t.skills_lang1_level)
            ]),
            TableRow(children: [
              const SizedBox(),
              TableCell2Bullet(text: t.skills_lang1_cert1)
            ]),
            TableRow(children: [
              const SizedBox(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextButton(
                      onPressed: () async {
                        await launchUrlString(t.skills_lang1_cert1_link);
                      },
                      child: Text(t.skills_lang1_cert1_link_descritpion)),
                ),
              )
            ]),
            TableRow(children: [
              const SizedBox(),
              TableCell2Bullet(text: t.skills_lang1_cert2)
            ]),
            const TableRow(children: [SizedBox(height: 16), SizedBox()]),

            // developer
            TableRow(
              children: [
                Tooltip(
                  key: tooltipkey,
                  message: t.skills_dev_title_tooltip,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Theme.of(context).canvasColor,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    // color: Theme.of(context).primaryTextTheme.bodyLarge!.color,
                  ),
                  child: Row(
                    children: [
                      TableCell1(text: t.skills_dev_title, bold: true),
                      IconButton(
                          onPressed: Global.isMobile == false
                              ? null
                              : () => tooltipkey.currentState
                                  ?.ensureTooltipVisible(),
                          icon: Icon(
                            Icons.info_outline,
                            color: Theme.of(context).disabledColor,
                            size: 20,
                          ))
                    ],
                  ),
                ),
                const SizedBox(),
              ],
            ),
            const TableRow(children: [SizedBox(height: 8), SizedBox()]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: TableCell1(text: "Flutter", bold: true),
              ),
              TableCol2Stars(number: 5)
            ]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: TableCell1(text: "Dart"),
              ),
              TableCol2Stars(number: 4)
            ]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: TableCell1(text: "Bloc (Cubit)"),
              ),
              TableCol2Stars(number: 5)
            ]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: TableCell1(text: "Firebase"),
              ),
              TableCol2Stars(number: 5)
            ]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: TableCell1(text: "Freezed"),
              ),
              TableCol2Stars(number: 4)
            ]),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: TableCell1(text: "Node.js"),
              ),
              TableCol2Stars(number: 2)
            ]),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: TableCell1(text: "Git"),
              ),
              TableCol2Stars(number: 4)
            ]),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: TableCell1(text: "iOS development"),
              ),
              TableCol2Stars(number: 2)
            ]),
            const TableRow(children: [SizedBox(height: 4), SizedBox()]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: TableCell1(text: "CI/CD"),
              ),
              TableCol2Stars(number: 1)
            ]),
            const TableRow(children: [SizedBox(height: 8), SizedBox()]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TableCell1(text: t.skills_dev_past),
              ),
              const SizedBox()
            ]),
            const TableRow(children: [SizedBox(height: 8), SizedBox()]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: TableCell1(text: "Python"),
              ),
              SizedBox()
            ]),
            const TableRow(children: [SizedBox(height: 8), SizedBox()]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: TableCell1(text: "SQL"),
              ),
              SizedBox()
            ]),
            const TableRow(children: [SizedBox(height: 8), SizedBox()]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: TableCell1(text: "Visual Basic / VBA"),
              ),
              SizedBox()
            ]),

            // other
            const TableRow(children: [SizedBox(height: 16), SizedBox()]),
            TableRow(
              children: [
                TableCell1(text: t.skills_other_title, bold: true),
                const SizedBox(),
              ],
            ),
            const TableRow(children: [
              SizedBox(height: 8),
              SizedBox(),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TableCell1(text: t.skills_other_skill1),
              ),
              const SizedBox()
            ]),

            // goals
            const TableRow(children: [SizedBox(height: 16), SizedBox()]),
            TableRow(
              children: [
                TableCell1(text: t.skills_goals_title, bold: true),
                TableCell1(text: t.skills_goals_title2),
              ],
            ),
            const TableRow(children: [
              SizedBox(height: 8),
              SizedBox(),
            ]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TableCell1(text: "- REST API"),
              ),
              SizedBox()
            ]),
            const TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TableCell1(text: "- MariaDB"),
              ),
              SizedBox()
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TableCell1(text: "- ${t.skills_goals_tests} ب_ب"),
              ),
              const SizedBox()
            ]),

            //
          ],
        ),
        const SizedBox(height: 128),
      ],
    );
  }
}

class TableCol2Stars extends StatelessWidget {
  final int number;
  const TableCol2Stars({
    this.number = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          for (int i = 1; i <= 5; i++) ...[
            Icon(
              i <= number ? Icons.star : Icons.star_border,
              size: 20,
            )
          ],
        ],
      ),
    );
  }
}
