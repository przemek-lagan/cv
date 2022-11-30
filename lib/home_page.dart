import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/core_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool platformDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
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
            children: const [
              ListTile(
                title: Text(
                  'O mnie',
                ),
              ),
              ListTile(
                title: Text(
                  'Projekty',
                ),
              ),
              ListTile(
                title: Text(
                  'Umiejętności',
                ),
              ),
              ListTile(
                title: Text(
                  'Wykształcenie',
                ),
              ),
              ListTile(
                title: Text(
                  'Kontakt',
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
