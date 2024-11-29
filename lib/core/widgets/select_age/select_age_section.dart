import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/models/bottom_picker_date_model.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../function/custom_bottom_picker_bottom_sheet.dart';
import 'age_range_widget.dart';

class SelectAgeSection extends StatelessWidget {
  const SelectAgeSection({super.key, required this.bottomPickerModel});
  final BottomPickerDateModel bottomPickerModel;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;
    return GestureDetector(
      onTap: () {
        customBottomPickerBottomSheet(context, isDarkMode,
                bottomPickerModel: bottomPickerModel)
            .show(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How Old are you ?', style: Styles.styleMedium16(context)),
            const SizedBox(height: 16),
            AgeRangeWidget(age: bottomPickerModel.age),
          ],
        ),
      ),
    );
  }
}
