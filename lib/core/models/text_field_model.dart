import 'package:flutter/material.dart';

class TextFieldModel {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText, enabled;
  final TextInputType? keyboardType;
  final double borderRadius, vertical, horizontal;
  final double? hight;
  final TextStyle? hintStyle;
  final Widget? prefixIcon, suffixIcon;

  TextFieldModel(
      {required this.hintText,
      required this.controller,
      this.validator,
      this.obscureText = false,
      this.enabled = true,
      this.keyboardType,
      this.borderRadius = 4,
      this.vertical = 16,
      this.horizontal = 12,
      this.hight,
      this.hintStyle,
      this.prefixIcon,
      this.suffixIcon});
}
