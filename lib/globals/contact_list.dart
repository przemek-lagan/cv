import 'package:carbon_icons/carbon_icons.dart';
import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/enums.dart';
import 'package:cv/pages/sections/shared/indent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactAction {
  final String tooltip;
  final Icon icon;
  final VoidCallback onTap;
  final String link;

  const ContactAction(
      {required this.tooltip,
      required this.icon,
      required this.onTap,
      required this.link});
}

class ContactList {
  static late List<ContactAction> actions;
  static late TextStyle contactTextStyle;
  static late PageLayout pageLayout;

  static void init(BuildContext context) {
    contactTextStyle = Theme.of(context).textTheme.bodyText1!;
    pageLayout = context.read<CoreCubit>().state.pageLayout;
    var t = AppLocalizations.of(context);
    actions = [
      ContactAction(
        tooltip: 'e-mail',
        icon: const Icon(CarbonIcons.email),
        link: t!.e_mail,
        onTap: () async {
          final String mailUrl = 'mailto:${t.e_mail}';
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
        link: t.whatsapp_link_short,
        onTap: () async => await launchUrlString(t.whatsapp_link),
      ),
      ContactAction(
        tooltip: 'GitHub',
        icon: const Icon(SimpleIcons.github),
        link: t.github_link_short,
        onTap: () async => await launchUrlString(t.github_link),
      ),
      ContactAction(
        tooltip: 'LinkedIn',
        icon: const Icon(SimpleIcons.linkedin),
        link: t.linkedIn_link_short,
        onTap: () async => await launchUrlString(t.linkedIn_link),
      ),
      ContactAction(
        tooltip: 'Facebook Messenger',
        icon: const Icon(SimpleIcons.messenger),
        link: t.messenger_link_short,
        onTap: () async => await launchUrlString(t.messenger_link),
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

  static List<Widget> get contactSectionFields => actions
      .map((action) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${action.tooltip}:',
                style: contactTextStyle,
              ),
              Row(
                children: [
                  indentWidget(pageLayout),
                  SelectableText(
                    action.link,
                    style: contactTextStyle,
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: action.link));
                    },
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ))
      .toList();
}
