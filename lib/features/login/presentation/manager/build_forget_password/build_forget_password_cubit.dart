import 'package:e_clot_shop/core/models/text_field_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_forget_password_state.dart';

class BuildForgetPasswordCubit extends Cubit<BuildForgetPasswordState> {
  BuildForgetPasswordCubit() : super(BuildForgetPasswordInitial()) {
    _initializeItems();
  }

  TextEditingController email = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextFieldModel> items = [];

  void _initializeItems() {
    items = [
      TextFieldModel(
          hintText: 'Enter Email address',
          keyboardType: TextInputType.emailAddress,
          controller: email,
          validator: (value) {
            if (value!.isNotEmpty && !EmailValidator.validate(value)) {
              return 'please enter a valid email';
            }
            if (value.isEmpty) {
              return 'please enter email';
            }
            return null;
          }),
    ];
  }
}
