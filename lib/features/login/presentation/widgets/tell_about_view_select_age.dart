import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/bottom_picker_date_model.dart';
import '../../../../core/widgets/select_age/select_age_section.dart';
import '../manager/tell_us/tell_us_cubit.dart';

class TellAboutViewSelectAge extends StatelessWidget {
  const TellAboutViewSelectAge({super.key});

  @override
  Widget build(BuildContext context) {
    var tellAbout = context.watch<TellUsCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SelectAgeSection(
          bottomPickerModel: BottomPickerDateModel(
              age: tellAbout.showdate,
              onSubmit: (index) {
                tellAbout.pickDate(index);
                // tellAbout.dateTime = DateTime(index.year, index.month, index.day);
              })),
    );
  }
}
