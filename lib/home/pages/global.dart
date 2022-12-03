import 'package:cv/home/pages/about_page/about_page_body.dart';
import 'package:cv/home/pages/contact.dart';
import 'package:cv/home/pages/education.dart';
import 'package:cv/home/pages/projects.dart';
import 'package:cv/home/pages/skills.dart';
import 'package:cv/home/pages/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';

enum ScaleFactor {
  standard(1.0, 1.0, 1),
  zoom10(1.1, 1.01, 1),
  zoom20(1.2, 1.0, 2),
  zoom30(1.3, 1.0, 3),
  zoom40(1.4, 1.0, 4);

  const ScaleFactor(this.value, this.correctionValue, this.flex);
  final double value;
  final double correctionValue;
  final int flex;
}

class Global {
  static late List<String> titles;
  static late List<Icon> icons;
  static late List<Widget> pages;
  static bool isMobile = defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
  static bool isWeb = kIsWeb;

  static void init(BuildContext context) {
    var t = AppLocalizations.of(context);
    titles = [
      t!.about_me_title,
      t.work_title,
      t.education_title,
      t.skills_title,
      t.projects_title,
      t.contact_title
    ];
    icons = [
      const Icon(Icons.home_outlined),
      const Icon(Icons.work_outline),
      const Icon(Icons.school_outlined),
      const Icon(Icons.handyman_outlined),
      const Icon(Icons.developer_mode_outlined),
      const Icon(Icons.contact_mail_outlined)
    ];
    pages = [
      const AboutPage(),
      const WorkPage(),
      const EducationPage(),
      const SkillsPage(),
      const ProjectsPage(),
      const ContactPage()
    ];
  }
}
