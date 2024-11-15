import 'package:bottom_picker/bottom_picker.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/theme/presentation/manager/change_theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/tell_us/tell_us_cubit.dart';
import 'age_range_widget.dart';

class SelectAgeSection extends StatelessWidget {
  const SelectAgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.watch<ChangeThemeCubit>().isDarkMode;
    return GestureDetector(
      onTap: () {
        BottomPicker.date(
          closeIconColor: isDarkMode ? Colors.white : Colors.black,
          initialDateTime: DateTime(2000),
          maxDateTime: DateTime(DateTime.now().year - 2),
          backgroundColor: isDarkMode
              ? AppColors.darkModeSecondryColor
              : AppColors.secondaryColor,
          pickerTitle: Text('Select a Date',
              style: Styles.styleBottomSheetAgeBold16.copyWith(
                  color: isDarkMode ? Colors.white : const Color(0xff272727))),
          pickerTextStyle: Styles.styleBottomSheetAgeBold16.copyWith(
              color: isDarkMode ? Colors.white : const Color(0xff272727)),
          onSubmit: (index) {
            context.read<TellUsCubit>().pickYear(index.year);
          },
        ).show(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How Old are you ?', style: Styles.styleMedium16(context)),
            const SizedBox(height: 16),
            const AgeRangeWidget(),
          ],
        ),
      ),
    );
  }
}
