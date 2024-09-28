import 'package:bottom_picker/bottom_picker.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/tell_us/tell_us_cubit.dart';
import 'age_range_widget.dart';

class SelectAgeSection extends StatelessWidget {
  const SelectAgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How Old are you ?', style: Styles.styleMedium16),
          const SizedBox(height: 16),
          AgeRangeWidget(onTap: () {
            BottomPicker.date(
              maxDateTime: DateTime.now(),
              backgroundColor: AppColors.secondaryColor,
              pickerTitle: Text('Select a Date',
                  style: Styles.styleBold16.copyWith(color: Colors.blue)),
              pickerTextStyle: Styles.styleBold16.copyWith(color: Colors.blue),
              onSubmit: (index) {
                context.read<TellUsCubit>().pickYear(index.year);
              },
            ).show(context);
          }),
        ],
      ),
    );
  }
}
