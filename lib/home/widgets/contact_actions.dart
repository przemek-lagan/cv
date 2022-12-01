import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactActions extends StatelessWidget {
  const ContactActions({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        IconButton(
          tooltip: 'e-mail: ${t!.e_mail}',
          onPressed: () async {
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
          icon: const Icon(SimpleIcons.gmail),
        ),
        IconButton(
          tooltip: 'WhatsApp: ${t.phone_number}',
          onPressed: () async {
            await launchUrlString(t.whatsapp_phone_link);
          },
          icon: const Icon(SimpleIcons.whatsapp),
        ),
        IconButton(
          tooltip: 'GitHub: ${t.github_name}',
          onPressed: () async {
            await launchUrlString('https://github.com/${t.github_name}');
          },
          icon: const Icon(SimpleIcons.github),
        ),
        IconButton(
          tooltip: 'LinkedIn',
          onPressed: () async {
            await launchUrlString(t.linkedIn_link);
          },
          icon: const Icon(SimpleIcons.linkedin),
        ),
        IconButton(
          tooltip: 'Facebook Messenger',
          onPressed: () async {
            await launchUrlString(t.messenger_link);
          },
          icon: const Icon(SimpleIcons.messenger),
        ),
      ],
    );
  }
}
