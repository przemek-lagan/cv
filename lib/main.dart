import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoreCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Przemysław Łagan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: const HomePage(),
      ),
    );
  }
}
