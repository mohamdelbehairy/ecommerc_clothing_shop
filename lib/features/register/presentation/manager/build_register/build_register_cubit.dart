import 'package:e_clot_shop/core/models/text_field_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_register_state.dart';

class BuildRegisterCubit extends Cubit<BuildRegisterState> {
  BuildRegisterCubit() : super(BuildRegisterInitial()) {
    _initializeItems();
  }

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextFieldModel> items = [];

  void _initializeItems() {
    items = [
      TextFieldModel(
          hintText: 'Firstname',
          controller: firstName,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter firstname';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'Lastname',
          controller: lastName,
          validator: (value) {
            if (value!.isEmpty && firstName.text.isNotEmpty) {
              return 'please enter lastname';
            }

            return null;
          }),
      TextFieldModel(
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          controller: email,
          validator: (value) {
            if (value!.isNotEmpty &&
                firstName.text.isNotEmpty &&
                lastName.text.isNotEmpty &&
                !EmailValidator.validate(value)) {
              return 'please enter a valid email';
            }
            if (value.isEmpty &&
                firstName.text.isNotEmpty &&
                lastName.text.isNotEmpty) {
              return 'please enter email';
            }
            return null;
          }),
      TextFieldModel(
          hintText: 'Password',
          obscureText: true,
          controller: password,
          validator: (value) {
            if (value!.isEmpty &&
                firstName.text.isNotEmpty &&
                lastName.text.isNotEmpty &&
                email.text.isNotEmpty &&
                EmailValidator.validate(email.text)) {
              return 'please enter password';
            }
            return null;
          }),
    ];
  }
}
