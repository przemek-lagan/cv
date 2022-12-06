import 'package:cv/home/pages/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('contactowator!!!!!');

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
            TableRow(
              children: [
                const TableCell1(text: 'e-mail:'),
                TableCell2SelectableText(label: t!.e_mail),
              ],
            ),
            const TableRow(children: [SizedBox(height: 16), SizedBox()]),
            TableRow(
              children: [
                TableCell1(text: '${t.phone}:'),
                TableCell2SelectableText(label: t.phone_number),
              ],
            ),
            const TableRow(children: [SizedBox(height: 16), SizedBox()]),
            TableRow(
              children: [
                const TableCell1(text: 'WhatsApp:'),
                TableCell2SelectableText(label: t.whatsapp_link_short),
              ],
            ),
            const TableRow(children: [SizedBox(height: 16), SizedBox()]),
            TableRow(
              children: [
                const TableCell1(text: 'GitHub:'),
                TableCell2SelectableText(label: 'github.com/${t.github_name}'),
              ],
            ),
            const TableRow(children: [SizedBox(height: 16), SizedBox()]),
            TableRow(
              children: [
                const TableCell1(text: 'LinkedIn:'),
                TableCell2SelectableText(label: t.linkedIn_link_short),
              ],
            ),
            const TableRow(children: [SizedBox(height: 16), SizedBox()]),
            TableRow(
              children: [
                const TableCell1(text: 'messenger:'),
                TableCell2SelectableText(label: t.messenger_link_short),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class TableCell2SelectableText extends StatelessWidget {
  final String label;
  const TableCell2SelectableText({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      label,
      style: const TextStyle(fontSize: 16),
    );
  }
}
