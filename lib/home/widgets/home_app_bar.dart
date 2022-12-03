import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool rotated;

  const HomeAppBar({
    Key? key,
    this.rotated = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool platformDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return AppBar(
          actions: [
            const Spacer(),
            const Spacer(),
            RotatedBox(
              quarterTurns: rotated ? 3 : 0,
              child: Icon(
                Global.isMobile ? Icons.phone_android : Icons.desktop_windows,
                color: Theme.of(context).disabledColor,
              ),
            ),
            Center(
              child: RotatedBox(
                quarterTurns: rotated ? 3 : 0,
                child: Text(
                  Global.isWeb ? ' web' : ' app',
                  style: TextStyle(color: Theme.of(context).disabledColor),
                ),
              ),
            ),
            const Spacer(),
            const IconButton(onPressed: null, icon: Icon(Icons.light_mode)),
            Switch(
                value: coreState.themeMode == null
                    ? platformDarkMode
                    : coreState.themeMode == ThemeMode.dark,
                onChanged: (_) =>
                    context.read<CoreCubit>().changeTheme(platformDarkMode)),
            RotatedBox(
                quarterTurns: rotated ? 3 : 0,
                child: const IconButton(
                    onPressed: null, icon: Icon(Icons.dark_mode))),
            const SizedBox(width: 32),
            const Center(),
            InkWell(
              radius: 60,
              customBorder: const CircleBorder(),
              onTap: () => context.read<CoreCubit>().switchLanguage(),
              child: SizedBox(
                width: 32,
                child: RotatedBox(
                  quarterTurns: rotated ? 3 : 0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        key: UniqueKey(),
                        bottom: rotated ? 0 : 10,
                        right: rotated ? 10 : 0,
                        child: Text(
                          coreState.en ? '🇵🇱' : '🇬🇧',
                          style: TextStyle(
                              color: Theme.of(context).disabledColor,
                              fontSize: 20),
                        ),
                      ),
                      Positioned(
                        key: UniqueKey(),
                        top: rotated ? 0 : 15,
                        left: rotated ? 15 : 0,
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
        );
      },
    );
  }
}
