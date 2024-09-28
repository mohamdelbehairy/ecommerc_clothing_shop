import 'package:flutter/material.dart';

import 'select_age_section.dart';
import 'select_type_section.dart';
import 'tell_about_finish_button.dart';
import 'tell_about_header.dart';

class TellAboutViewBody extends StatelessWidget {
  const TellAboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        TellAboutHeader(),
        SizedBox(height: 30),
        SelectTypeSection(),
        SizedBox(height: 80),
        SelectAgeSection(),
        Spacer(),
        TellAboutFinshButton(),
      ],
    );
  }
}

