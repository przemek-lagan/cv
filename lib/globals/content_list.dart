import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cv/home/pages/about_page/about_page_body.dart';
import 'package:cv/home/pages/contact.dart';
import 'package:cv/home/pages/projects.dart';
import 'package:cv/home/pages/skills.dart';
import 'package:cv/home/pages/start.dart';
import 'package:flutter/material.dart';

class ContentPage {
  final String title;
  final Icon icon;
  final Widget content;

  const ContentPage(this.title, this.icon, this.content);
}

class ContentList {
  static late List<ContentPage> pages;

  static void init(BuildContext context) {
    var t = AppLocalizations.of(context);

 pages = [
  ContentPage(
    t!.start_title,
    const Icon(Icons.home_outlined),
    const StartPage(),
  ),
  ContentPage(
    t.about_title,
    const Icon(Icons.person_outline),
    const AboutPage(),
  ),
  ContentPage(
    t.skills_title,
    const Icon(Icons.handyman_outlined),
    const SkillsPage(),
  ),
  ContentPage(
    t.projects_title,
    const Icon(Icons.developer_mode_outlined),
    const ProjectsPage(),
  ),
  ContentPage(
    t.contact_title,
    const Icon(Icons.contact_mail_outlined),
    const ContactPage(),
  ),
];


  }
}


