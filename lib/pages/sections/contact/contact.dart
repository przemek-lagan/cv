import 'dart:math';

import 'package:cv/cubit/core_cubit.dart';
import 'package:cv/globals/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Contact extends StatelessWidget {
  const Contact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...ContactList.contactSectionFields,
            SizedBox(height: max((coreState.windowHeight - 540), 0)),
          ],
        );
      },
    );
  }
}
