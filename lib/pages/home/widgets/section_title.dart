import 'package:cv/themes/text_styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final CrossAxisAlignment crossAxisAlignment;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.sectionTitle,
        ),
        const Divider(),
        const SizedBox(height: 16),
      ],
    );
  }
}
