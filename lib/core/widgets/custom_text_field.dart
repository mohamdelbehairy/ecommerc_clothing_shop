import 'package:e_clot_shop/core/models/text_field_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: TextField(
          controller: textFieldModel.controller,
          obscureText: textFieldModel.obscureText,
          decoration: InputDecoration(
            hintText: textFieldModel.hintText,
            hintStyle: Styles.styleTextField16,
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
