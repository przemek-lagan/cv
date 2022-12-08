part of 'skills.dart';

List<dynamic> _skills = [
  // [0] - name,
  // [1] - skill level (negative for old skills, needing some work to refresh)
  // [2] - importance (10 = neutral)
  ['Flutter', 10, 20],
  ['Dart', 8, 18],
  ['Cubit', 8, 16],
  ['Firebase', 9, 16],
  ['Freezed', 7, 16],
  ['Node.js', 3, 16],
  ['Git', 6, 16],
  ['iOS development', 3, 10],
  ['CI/CD', 1, 10],
  ['Python', -5, 10],
  ['SQLite', -4, 10],
  ['Visual Basic', -5, 9],
  ['VBA', -7, 8],
  ['AutoCAD', 10, 8],
  ['Lisp', -2, 12],
  ['Google Apps Script', -2, 14],
  ['Excel automation', 7, 8],
  ['Google Sheets', 8, 7],
  ['Sketchup 3D', -8, 6]
];

List<Widget> _skillWidgetList(BuildContext context) => _skills.map((e) {
      String name = e[0];
      int level = (e[1] as int).abs();
      bool fresh = e[1] > 0;
      int importance = e[2];
      Color color = Theme.of(context)
          .textTheme
          .skillScatterText
          .color!
          .withOpacity(1 / 10 * level);
      if (importance < 10) {
        color = Theme.of(context)
            .textTheme
            .bodyText1!
            .color!
            .withOpacity(1 / 13 * level);
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Text(
          fresh ? name : '($name)',
          style: Theme.of(context).textTheme.skillScatterText.copyWith(
              fontWeight: importance >= 10 ? FontWeight.bold : null,
              color: color,
              fontSize: Theme.of(context).textTheme.skillScatterText.fontSize! *
                      level /
                      10 +
                  importance *
                      context.read<CoreCubit>().state.pageLayout.widthfactor),
        ),
      );
    }).toList();
