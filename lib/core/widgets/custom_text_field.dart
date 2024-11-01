import 'package:e_clot_shop/core/models/text_field_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(textFieldModel.borderRadius),
      child: TextFormField(
          cursorColor: AppColors.primaryColor,
          keyboardType: textFieldModel.keyboardType,
          validator: textFieldModel.validator,
          controller: textFieldModel.controller,
          obscureText: textFieldModel.obscureText,
          enabled: textFieldModel.enabled,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              hintText: textFieldModel.hintText,
              prefixIcon: textFieldModel.prefixIcon,
              suffixIcon: textFieldModel.suffixIcon,
              hintStyle: textFieldModel.hintStyle ?? Styles.styleTextField16,
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.secondaryColor)),
    );
  }
}
