import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/core_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              const IconButton(onPressed: null, icon: Icon(Icons.light_mode)),
              Switch(
                  value: coreState.darkMode,
                  onChanged: (_) => context.read<CoreCubit>().switchTheme()),
              const IconButton(onPressed: null, icon: Icon(Icons.dark_mode)),
              const SizedBox(width: 16),
              const Center(),
              IntrinsicHeight(
                child: SizedBox(
                  width: 32,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Text(
                        'PL',
                        style: TextStyle(backgroundColor: Colors.green),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: Text(
                          'EN',
                          style:
                              TextStyle(color: Theme.of(context).disabledColor),
                        ),
                      ),
                    ],
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
