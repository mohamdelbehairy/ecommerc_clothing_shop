import 'package:flutter/material.dart';

class TextFieldModel {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final double borderRadius;

  TextFieldModel(
      {required this.hintText,
      required this.controller,
      this.validator,
      this.obscureText = false,
      this.keyboardType,
      this.borderRadius = 4});
}
