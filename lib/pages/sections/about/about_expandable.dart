part of 'about.dart';

class _AboutExpandable extends StatefulWidget {
  final PageLayout pageLayout;
  const _AboutExpandable({
    required this.pageLayout,
    Key? key,
  }) : super(key: key);

  @override
  State<_AboutExpandable> createState() => _AboutExpandableState();
}

class _AboutExpandableState extends State<_AboutExpandable> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return InkWell(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (widget, animation) => SizeTransition(
          axisAlignment: 1.0,
          sizeFactor: animation,
          child: widget,
        ),
        child: _expanded
            ? Text.rich(
                key: const Key('expanded'),
                style: Theme.of(context).textTheme.bodyText1,
                TextSpan(
                  children: [
                    indentSpan(widget.pageLayout),
                    // indentSpan(widget.pageLayout),
                    TextSpan(text: t!.about_expanded_info1),
                    TextSpan(
                        text: t.about_expanded_info2a,
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness:
                                context.read<CoreCubit>().state.themeMode ==
                                        ThemeMode.dark
                                    ? 1.5
                                    : 1)),
                    TextSpan(text: t.about_expanded_info2b),
                    tooltipSpan(
                      context: context,
                      child: t.about_expanded_info3_tooltip_body,
                      tooltip: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.asset('assets/images/facepalm.jpg',
                            fit: BoxFit.fill),
                      ),
                      textStyle: Theme.of(context).textTheme.bodyText1!,
                      border: false,
                    ),
                    const TextSpan(text: '.'),
                    TextSpan(text: t.about_expanded_info4),
                    const TextSpan(
                      text: '\n',
                    ),
                    indentSpan(widget.pageLayout),
                    TextSpan(
                      text: t.about_expanded_info5,
                    ),
                    TextSpan(
                        text: t.about_expanded_info6a,
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness:
                                context.read<CoreCubit>().state.themeMode ==
                                        ThemeMode.dark
                                    ? 1.5
                                    : 1)),
                    TextSpan(text: t.about_expanded_info6b),
                  ],
                ),
              )
            : Align(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    '(${t!.about_expanded_tooltip})',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize:
                              Theme.of(context).textTheme.bodyText1!.fontSize! *
                                  0.7,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(.7),
                        ),
                  ),
                ),
              ),
      ),
    );
  }
}
