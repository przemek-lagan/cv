import 'package:cv/home/pages/global.dart';
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
  // required GlobalKey<TooltipState> tooltipkey,
  required BuildContext context,
  required String text,
  required Widget child,
  required TextStyle textStyle,
  // required PageLayout scaleFactor,
  bool border = true,
}) {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  return WidgetSpan(
    child: Tooltip(
      key: tooltipkey,
      richMessage: WidgetSpan(
        child: child,
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
        child: Text.rich(
          TextSpan(
            text: text,
            style: textStyle.copyWith(color: Theme.of(context).hintColor),
          ),
          // textAlign: TextAlign.start,
          // textScaleFactor: scaleFactor.textCorrection,
          // style: TextStyle(
          //   color: Theme.of(context).hintColor,
          // ),
        ),
      ),
    ),
  );
}
