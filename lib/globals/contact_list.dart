import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactAction {
  final String tooltip;
  final Icon icon;
  final VoidCallback onTap;

  const ContactAction(
      {required this.tooltip, required this.icon, required this.onTap});
}

class ContactList {
  static late List<ContactAction> actions;

  static void init(BuildContext context) {
    var t = AppLocalizations.of(context);
    actions = [
      ContactAction(
        tooltip: 'e-mail',
        icon: const Icon(SimpleIcons.gmail),
        onTap: () async {
          final String mailUrl = 'mailto:${t!.e_mail}';
          try {
            await Clipboard.setData(ClipboardData(text: t.e_mail));
            await launchUrlString(mailUrl).then(
                (_) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(t.e_mail_copied),
                    )));
          } catch (e) {
            await launchUrlString(mailUrl).then(
                (_) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(t.e_mail_copied),
                    )));
          }
        },
      ),
      ContactAction(
        tooltip: 'WhatsApp',
        icon: const Icon(SimpleIcons.whatsapp),
        onTap: () async => await launchUrlString(t!.whatsapp_link),
      ),
      ContactAction(
        tooltip: 'GitHub',
        icon: const Icon(SimpleIcons.github),
        onTap: () async =>
            await launchUrlString('https://github.com/${t!.github_name}'),
      ),
      ContactAction(
        tooltip: 'LinkedIn',
        icon: const Icon(SimpleIcons.linkedin),
        onTap: () async => await launchUrlString(t!.linkedIn_link),
      ),
      ContactAction(
        tooltip: 'Facebook Messenger',
        icon: const Icon(SimpleIcons.messenger),
        onTap: () async => await launchUrlString(t!.messenger_link),
      ),
    ];
  }

  static List<SpeedDialChild> get fabActions => actions
      .map((action) => SpeedDialChild(
          onTap: action.onTap,
          child: Tooltip(
            message: action.tooltip,
            child: action.icon,
          )))
      .toList();

  static List<Widget> get buttonActions => actions
      .map((action) => IconButton(
            tooltip: action.tooltip,
            onPressed: action.onTap,
            icon: action.icon,
          ))
      .toList();
}


// IconButton(
//           tooltip: 'WhatsApp: ${t.phone_number}',
//           onPressed: () async {
//             await launchUrlString(t.whatsapp_link);
//           },
//           icon: const Icon(SimpleIcons.whatsapp),
//         ),