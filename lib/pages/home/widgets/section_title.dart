part of '../home_page.dart';

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    Key? key,
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
