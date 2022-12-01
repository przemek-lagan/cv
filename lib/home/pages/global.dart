import 'package:cv/home/pages/about.dart';
import 'package:cv/home/pages/contact.dart';
import 'package:cv/home/pages/education.dart';
import 'package:cv/home/pages/projects.dart';
import 'package:cv/home/pages/skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageList {
  static late List<String> titles;
  static late List<Icon> icons;
  static late List<Widget> pages;

  static void init(BuildContext context) {
    var t = AppLocalizations.of(context);
    titles = [
      t!.about_me_title,
      t.projects_title,
      t.skills_title,
      t.education_title,
      t.contact_title
    ];
    icons = [
      const Icon(Icons.person_search_outlined),
      const Icon(Icons.developer_mode_outlined),
      const Icon(Icons.handyman_outlined),
      const Icon(Icons.school_outlined),
      const Icon(Icons.contact_mail_outlined)
    ];
    pages = [
      const AboutPage(),
      const ProjectsPage(),
      const SkillsPage(),
      const EducationPage(),
      const ContactPage()
    ];
  }
}
