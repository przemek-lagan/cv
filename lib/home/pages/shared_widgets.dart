import 'package:flutter/material.dart';



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
