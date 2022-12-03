import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/about_page/about_bio.dart';
import 'package:cv/home/pages/about_page/about_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 16),
                Flexible(
                  flex: 2,
                  // width: 100,
                  child: Container(
                      constraints: const BoxConstraints(maxWidth: 250),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              child: Image.asset('assets/photos/avatar.jpg')),
                        ],
                      )),
                ),
                const SizedBox(width: 16),
                const Flexible(
                  flex: 6,
                  child: AboutColumn(),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(
                    16 + coreState.scaleFactor.flex.toDouble() * 2)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Curriculum Vitae',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 64),
            AboutBio(scaleFactor:  coreState.scaleFactor),
          ],
        );
      },
    );
  }
}
