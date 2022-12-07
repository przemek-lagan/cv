part of 'skills.dart';

class _SkillCloud extends StatelessWidget {
  const _SkillCloud({
    Key? key,
    required this.t,
    required this.textScale,
  }) : super(key: key);

  final AppLocalizations? t;
  final double textScale;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text.rich(TextSpan(children: [
            tooltipSpan(
              context: context,
              child: Icon(Icons.question_mark,
                  color: Theme.of(context).disabledColor),
              tooltip: SizedBox(
                width: 400 * textScale,
                child: Text.rich(
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText1,
                    TextSpan(children: [
                      TextSpan(text: t!.skills_cloud_tooltip1),
                      const TextSpan(text: '\n'),
                      TextSpan(text: t!.skills_cloud_tooltip2),
                      const TextSpan(text: '\n\n'),
                      TextSpan(text: t!.skills_cloud_tooltip3),
                    ])),
              ),
            ),
          ])),
        ),
        Align(
          alignment: Alignment.center,
          child: Scatter(
            alignment: Alignment.center,
            delegate: ArchimedeanSpiralScatterDelegate(
              ratio: textScale * textScale,
            ),
            fillGaps: true,
            children: _skillWidgetList(context),
          ),
        ),
      ],
    );
  }
}

