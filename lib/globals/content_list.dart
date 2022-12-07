import 'package:cv/pages/sections/contact/contact.dart';
import 'package:cv/pages/sections/projects/projects.dart';
import 'package:cv/pages/sections/skills/skills.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cv/pages/sections/about/about.dart';
import 'package:cv/pages/sections/start/start.dart';
import 'package:flutter/material.dart';

class ContentPage {
  final String title;
  final Icon icon;
  final Widget content;
  final bool showTitle;

  const ContentPage(this.title, this.icon, this.content,
      {this.showTitle = true});
}

class ContentList {
  static late List<ContentPage> pages;

  static void init(BuildContext context) {
    var t = AppLocalizations.of(context);

    pages = [
      ContentPage(
        t!.start_title,
        const Icon(Icons.home_outlined),
        const Start(),
        showTitle: false,
      ),
      ContentPage(
        t.about_title,
        const Icon(Icons.person_outline),
        const About(),
      ),
      ContentPage(
        t.skills_title,
        const Icon(Icons.handyman_outlined),
        const Skills(),
      ),
      ContentPage(
        t.projects_title,
        const Icon(Icons.developer_mode_outlined),
        const Projects(),
      ),
      ContentPage(
        t.contact_title,
        const Icon(Icons.contact_mail_outlined),
        const Contact(),
      ),
    ];
  }
}
