import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/build_forget_password/build_forget_password_cubit.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildForgetPassword = context.watch<BuildForgetPasswordCubit>();
    return CustomButton(
        customButtonModel: CustomButtonModel(
            onTap: () {
              if (buildForgetPassword.formKey.currentState!.validate()) {
                buildForgetPassword.formKey.currentState!.save();
              }
            },
            buttonName: 'Continue'));
  }
}
