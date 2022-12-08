part of 'skills.dart';

class _SkillCloud extends StatelessWidget {
  const _SkillCloud({
    Key? key,
    required this.t,
    required this.pageLayout,
  }) : super(key: key);

  final AppLocalizations? t;
  final PageLayout pageLayout;

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
                width: 400 * pageLayout.textScale,
                child: Text.rich(
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText1,
                    TextSpan(children: [
                      TextSpan(text: t!.skills_cloud_tooltip1),
                      const WidgetSpan(child: SizedBox()),
                      const TextSpan(text: '\n'),
                      TextSpan(text: t!.skills_cloud_tooltip2),
                      const TextSpan(text: '\n\n'),
                      TextSpan(text: t!.skills_cloud_tooltip3),
                    ])),
              ),
            ),
          ])),
        ),
        if (pageLayout.index <= PageLayout.narrow2.index)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: _skillWidgetList(context),
            ),
          )
        else
          Align(
            alignment: Alignment.center,
            child: Scatter(
              alignment: Alignment.center,
              delegate: ArchimedeanSpiralScatterDelegate(
                ratio: pageLayout.textScale *
                    pageLayout.textScale *
                    pow(pageLayout.widthfactor, 2),
              ),
              fillGaps: true,
              children: _skillWidgetList(context),
            ),
          ),
      ],
    );
  }
}
