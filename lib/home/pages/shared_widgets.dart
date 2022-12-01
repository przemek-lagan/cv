import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Divider(),
        const SizedBox(height: 16),
      ],
    );
  }
}

class TableCell1 extends StatelessWidget {
  final String label;
  final bool bold;
  const TableCell1({
    required this.label,
    this.bold = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 16, fontWeight: bold ? FontWeight.bold : null),
    );
  }
}
