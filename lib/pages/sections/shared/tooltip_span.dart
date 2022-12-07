import 'package:cv/globals/platform_globals.dart';
import 'package:flutter/material.dart';

// WidgetSpan borderlessTooltipSpan({
//   required GlobalKey<TooltipState> tooltipkey,
//   required BuildContext context,
//   required String text,
//   required Widget child,
//   required PageLayout scaleFactor,
// }) {
//   return tooltipSpan(
//     // tooltipkey: tooltipkey,
//     context: context,
//     text: text,
//     child: child,
//     border: false,
//     // scaleFactor: scaleFactor,
//   );
// }

WidgetSpan tooltipSpan({
  required BuildContext context,
  required var child,
  required Widget tooltip,
  TextStyle? textStyle,
  bool border = true,
}) {
  if (child.runtimeType == String) {
    child = Text.rich(TextSpan(
      text: child,
      style: textStyle?.copyWith(color: Theme.of(context).hintColor),
    ));
  }
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  return WidgetSpan(
    child: Tooltip(
      key: tooltipkey,
      richMessage: WidgetSpan(
        child: tooltip,
      ),
      decoration: border
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
              color: Theme.of(context).canvasColor,
            )
          : const BoxDecoration(),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: Global.isMobile == false
            ? null
            : () => tooltipkey.currentState?.ensureTooltipVisible(),
        child: child,
      ),
    ),
  );
}
