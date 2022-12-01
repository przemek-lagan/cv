import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Text('e-mail: przemek.lagan.dev@gmail.com'),
        ],
      ),
    );
  }
}