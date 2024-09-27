import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/forget_password_and_reset.dart';
import '../manager/build_register/build_register_cubit.dart';
import 'register_text_fields.dart';

class RegisterTextFieldAndButtonsSection extends StatelessWidget {
  const RegisterTextFieldAndButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var buildRegister = context.watch<BuildRegisterCubit>();
    return BlocBuilder<BuildRegisterCubit, BuildRegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Form(
            key: buildRegister.formKey,
            child: Column(
              children: [
                const RegisterTextFields(),
                const SizedBox(height: 40 - 16),
                CustomButton(
                    customButtonModel: CustomButtonModel(
                        onTap: () {
                          if (buildRegister.formKey.currentState!.validate()) {
                            buildRegister.formKey.currentState!.save();
                          }
                        },
                        buttonName: 'Continue')),
                const SizedBox(height: 30),
                const ForgetPasswordAndReset()
              ],
            ),
          ),
        );
      },
    );
  }
}
