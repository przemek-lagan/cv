import 'package:flutter/material.dart';

class NoSpaceWarning extends StatelessWidget {
  const NoSpaceWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      'Mam za mało miejsca!\n' 'Powiększ proszę to okno...',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    )));
  }
}
