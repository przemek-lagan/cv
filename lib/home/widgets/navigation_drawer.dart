import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/home/pages/global.dart';
import 'package:cv/home/widgets/contact_actions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
    required this.controller,
    this.isDrawer = true,
  }) : super(key: key);

  final PageController controller;
  final bool isDrawer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Container(
          color: Colors.blue.shade900.withOpacity(.1),

          // height: 200,
          width: 250,
          child: Column(
            children: [
              const SizedBox(height: 32),
              CircleAvatar(
                radius: 64,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(64),
                  child: Image.asset('assets/photos/avatar.jpg'),
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: PageList.titles.map((e) {
                      int index = PageList.titles.indexOf(e);
                      return ListTile(
                        leading: PageList.icons[index],
                        selected: index == coreState.activePageIndex,
                        title: Text(e),
                        onTap: () {
                          context
                              .read<CoreCubit>()
                              .changeActivePageIndex(index);
                          if (isDrawer) Navigator.of(context).pop();
                          controller.animateToPage(
                            index,
                            duration: Duration(
                              milliseconds: 300 *
                                  (1 +
                                      (index - (controller.page?.toInt() ?? 0))
                                          .abs()
                                          .toInt()),
                            ),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              const ContactActions(),
              const SizedBox(height: 8)
            ],
          ),
        );
      },
    );
  }
}
