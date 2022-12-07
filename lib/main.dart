import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/pages/home/home_page.dart';
import 'package:cv/themes/theme_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO platform-dependend controls (touch/wheel)
// TODO platform/size-dependend layouts & fonts

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoreCubit()..init(),
      child: BlocBuilder<CoreCubit, CoreState>(
        builder: (context, coreState) {
          ThemeData lightThemeData = lightTheme(coreState.pageLayout.textScale);
          ThemeData darkThemeData = darkTheme(coreState.pageLayout.textScale);
          print(darkThemeData.brightness);
          return MaterialApp(
            // useInheritedMediaQuery: true,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: coreState.en ? const Locale('en') : const Locale('pl'),
            debugShowCheckedModeBanner: false,
            title: 'Przemysław Łagan',
            theme: lightThemeData,
            darkTheme: darkThemeData,
            themeMode: coreState.themeMode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
