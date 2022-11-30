import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      create: (context) => CoreCubit(),
      child: BlocBuilder<CoreCubit, CoreState>(
        builder: (context, coreState) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: coreState.en ? const Locale('en') : const Locale('pl'),
            debugShowCheckedModeBanner: false,
            title: 'Przemysław Łagan',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: coreState.themeMode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
