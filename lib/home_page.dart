import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubit/core_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    PageController controller = PageController();
    bool platformDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    List<Widget> pages = [
      const AboutPage(),
      const ProjectsPage(),
      const SkillsPage(),
      const EducationPage(),
      const ContactPage(),
    ];
    List<String> titles = [
      t!.about_me_title,
      t.projects_title,
      t.skills_title,
      t.education_title,
      t.contact_title
    ];
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              const IconButton(onPressed: null, icon: Icon(Icons.light_mode)),
              Switch(
                  value: coreState.themeMode == null
                      ? platformDarkMode
                      : coreState.themeMode == ThemeMode.dark,
                  onChanged: (_) =>
                      context.read<CoreCubit>().changeTheme(platformDarkMode)),
              const IconButton(onPressed: null, icon: Icon(Icons.dark_mode)),
              const SizedBox(width: 32),
              const Center(),
              // TODO prettify button highlight
              InkWell(
                onTap: () => context.read<CoreCubit>().switchLanguage(),
                child: SizedBox(
                  width: 32,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 2000),
                    transitionBuilder: (widget, animation) => SizeTransition(
                      axisAlignment: 1.0,
                      sizeFactor: animation,
                      child: widget,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          key: UniqueKey(),
                          bottom: 10,
                          right: 0,
                          child: Text(
                            coreState.en ? '🇵🇱' : '🇬🇧',
                            style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontSize: 20),
                          ),
                        ),
                        Positioned(
                          key: UniqueKey(),
                          top: 15,
                          left: 0,
                          child: Text(
                            coreState.en ? '🇬🇧' : '🇵🇱',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: titles.map((e) {
                int index = titles.indexOf(e);
                return ListTile(
                  selected: index == coreState.activePageIndex,
                  title: Text(e),
                  onTap: () {
                    context.read<CoreCubit>().changeActivePageIndex(index);
                    Navigator.of(context).pop();
                    controller.animateToPage(
                      index,
                      duration: Duration(
                        milliseconds: 400 *
                            (1 +
                                (index - (controller.page?.toInt() ?? 0))
                                    .abs()
                                    .toInt()),
                      ),
                      curve: Curves.easeInOutCubic,
                    );
                  },
                );
              }).toList(),
              // [
              //   ListTile(
              //     title: Text(t.about_me_title),
              //   ),
              //   ListTile(
              //     title: Text(
              //       t.projects_title,
              //     ),
              //   ),
              //   ListTile(
              //     title: Text(
              //       t.skills_title,
              //     ),
              //   ),
              //   ListTile(
              //     title: Text(
              //       t.education_title,
              //     ),
              //   ),
              //   ListTile(
              //     title: Text(
              //       t.contact_title,
              //     ),
              //   ),
              // ],
            ),
          ),
          body: PageView(
            onPageChanged: (index) =>
                context.read<CoreCubit>().changeActivePageIndex(index),
            controller: controller,
            scrollDirection: Axis.vertical,
            children: pages,
          ),
        );
      },
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('about');
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('projects');
  }
}

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('skills');
  }
}

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('education');
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('contact');
  }
}
