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
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const Divider(),
        const SizedBox(height: 16),
      ],
    );
  }
}

class TableCell1 extends StatelessWidget {
  final String text;
  final bool bold;
  const TableCell1({
    required this.text,
    this.bold = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: bold ? FontWeight.bold : null),
    );
  }
}

class TableCell2Bullet extends StatelessWidget {
  final String text;
  final bool skipBullet;

  const TableCell2Bullet({
    required this.text,
    this.skipBullet = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skipBullet ? '   ' : '-  ',
              style: const TextStyle(fontSize: 16)),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
