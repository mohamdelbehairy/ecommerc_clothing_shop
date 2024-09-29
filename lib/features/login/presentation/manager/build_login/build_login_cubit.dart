import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/text_field_model.dart';

part 'build_login_state.dart';

class BuildLoginCubit extends Cubit<BuildLoginState> {
  BuildLoginCubit() : super(BuildLoginInitial()) {
    _initializeItems();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKeyOne = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyTwo = GlobalKey<FormState>();

  List<TextFieldModel> items = [];


  String userName = '';

  void _initializeItems() {
    items = [
      TextFieldModel(
          hintText: 'Email Address',
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
      TextFieldModel(
          hintText: 'Password',
          obscureText: true,
          controller: password,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter password';
            }
            return null;
          }),
    ];
  }
}
