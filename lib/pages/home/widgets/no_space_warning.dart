import 'package:flutter/material.dart';

class NoSpaceWarning extends StatelessWidget {
  final String? additionalInfo;
  const NoSpaceWarning({this.additionalInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Mam za mało miejsca!\n' 'Powiększ proszę to okno...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              if (additionalInfo != null) Text('\n\n${additionalInfo!}'),
            ],
          ),
        ),
      ),
    );
  }
}
