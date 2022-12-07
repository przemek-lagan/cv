import 'package:cv/globals/enums.dart';
import 'package:cv/home/pages/shared_widgets/tooltip_span.dart';
import 'package:cv/pages/sections/shared/indent_span.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AboutBio extends StatefulWidget {
  final PageLayout scaleFactor;
  const AboutBio({
    required this.scaleFactor,
    Key? key,
  }) : super(key: key);

  @override
  State<AboutBio> createState() => _AboutBioState();
}

class _AboutBioState extends State<AboutBio> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipkey1 = GlobalKey<TooltipState>();
    final GlobalKey<TooltipState> tooltipkey2 = GlobalKey<TooltipState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text.rich(
          textAlign: TextAlign.justify,
          TextSpan(
            children: [
              indentSpan(widget.scaleFactor),
              const TextSpan(
                  // style: Theme.of(context).textTheme.bodyText1,
                  text: 'Rozpocząłem karierę jako inżynier chemik, '
                      'jednak szybko odkryłem że pociąga mnie kodowanie, '
                      'które wkrótce stało się moim '),
              tooltipSpanOld(
                tooltipkey: tooltipkey1,
                context: context,
                text: 'hobby.',
                scaleFactor: widget.scaleFactor,
                child: Text.rich(
                  textScaleFactor: widget.scaleFactor.textScale,
                  const TextSpan(text: 'czy też raczej obsesją...'),
                ),
              ),
              if (!_expanded)
                TextSpan(
                  text: ' (...)',
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => setState(() => _expanded = !_expanded),
                  style: const TextStyle(color: Colors.blue),
                ),
              const TextSpan(
                  // style: Theme.of(context).textTheme.bodyText1,
                  text: '\n'),
              WidgetSpan(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder: (widget, animation) => SizeTransition(
                    axisAlignment: 1.0,
                    sizeFactor: animation,
                    child: widget,
                  ),
                  child: _expanded == false
                      ? null
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _expanded = !_expanded;
                            });
                          },
                          child: Text.rich(
                            textAlign: TextAlign.justify,
                            textScaleFactor: widget.scaleFactor.textCorrection,
                            TextSpan(
                              children: [
                                indentSpan(widget.scaleFactor),
                                const TextSpan(
                                    text: 'Tak rozpocząłem przygodę z '),
                                const TextSpan(
                                    text: 'debugowaniem',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationThickness: 2)),
                                const TextSpan(
                                    text:
                                        ' programowaniem, zaczynając od automatyzacji wszelakich arkuszy '
                                        'obliczeniowych przy użyciu VBA, poprzez integrację '
                                        'Excela z AutoCAD-em a kończąc na programie do web '
                                        'scrapingu, zapisującym dane w ważącej kilkaset MB '
                                        'wieloplikowej bazie danych w... '),
                                borderlessTooltipSpan(
                                  tooltipkey: tooltipkey2,
                                  context: context,
                                  text: 'Excelu.',
                                  scaleFactor: widget.scaleFactor,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Image.asset(
                                        'assets/images/facepalm.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ' Szybko zrozumiałem swój błąd i przeszedłem na Visual '
                                      'Basic, a następnie Pythona, używając SQLite '
                                      'dla obsługi lokalnej bazy danych.',
                                ),
                                const TextSpan(
                                  text: '\n',
                                ),
                                indentSpan(widget.scaleFactor),
                                const TextSpan(
                                  text:
                                      'Niestety, wszystkie powyższe przygody z '
                                      'programowaniem dość szybko się kończyły, '
                                      'głównie z powodu braku czasu na to ',
                                ),
                                const TextSpan(
                                    text: 'uzależnienie',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationThickness: 2)),
                                const TextSpan(text: ' hobby.'),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
