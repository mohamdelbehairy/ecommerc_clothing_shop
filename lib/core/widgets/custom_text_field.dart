import 'package:e_clot_shop/core/models/text_field_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_app/build_app_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: textFieldModel.hight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(textFieldModel.borderRadius),
        child: TextFormField(
          onChanged: textFieldModel.onChanged,
            style: Styles.styleTextField18(context),
            cursorColor: AppColors.primaryColor,
            keyboardType: textFieldModel.keyboardType,
            validator: textFieldModel.validator,
            controller: textFieldModel.controller,
            obscureText: textFieldModel.obscureText,
            enabled: textFieldModel.enabled,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: textFieldModel.vertical,
                    horizontal: textFieldModel.horizontal),
                hintText: textFieldModel.hintText,
                prefixIcon: textFieldModel.prefixIcon,
                suffixIcon: textFieldModel.suffixIcon,
                hintStyle: textFieldModel.hintStyle ??
                    Styles.styleHintTextField16(context),
                border: InputBorder.none,
                filled: true,
                fillColor: context.read<BuildAppCubit>().isDarkMode
                    ? AppColors.darkModeSecondryColor
                    : AppColors.secondaryColor)),
      ),
    );
  }
}
