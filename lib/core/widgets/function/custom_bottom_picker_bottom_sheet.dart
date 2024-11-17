import 'package:bottom_picker/bottom_picker.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../models/bottom_picker_date_model.dart';

BottomPicker customBottomPickerBottomSheet(
    BuildContext context, bool isDarkMode,
    {required BottomPickerDateModel bottomPickerModel}) {
  return BottomPicker.date(
    closeIconColor: isDarkMode ? Colors.white : Colors.black,
    initialDateTime: bottomPickerModel.initialDateTime ?? DateTime(2000),
    maxDateTime: DateTime(DateTime.now().year - 2),
    backgroundColor:
        isDarkMode ? AppColors.darkModeSecondryColor : AppColors.secondaryColor,
    pickerTitle: Text('Select a Date',
        style: Styles.styleBottomSheetAgeBold16(context).copyWith(
            color: isDarkMode ? Colors.white : const Color(0xff272727))),
    pickerTextStyle: Styles.styleBottomSheetAgeBold16(context)
        .copyWith(color: isDarkMode ? Colors.white : const Color(0xff272727)),
    onSubmit: bottomPickerModel.onSubmit,
  );
}
