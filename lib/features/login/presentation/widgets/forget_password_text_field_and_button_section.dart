import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../manager/build_forget_password/build_forget_password_cubit.dart';
import 'forget_password_button.dart';

class ForgetPasswordTextFieldAndButtonSection extends StatelessWidget {
  const ForgetPasswordTextFieldAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    var buildForgetPassword = context.watch<BuildForgetPasswordCubit>();
    return BlocBuilder<BuildForgetPasswordCubit, BuildForgetPasswordState>(
      builder: (context, state) {
        return Form(
          key: buildForgetPassword.formKey,
          child: Column(
            children: [
              CustomTextField(textFieldModel: buildForgetPassword.items[0]),
              const SizedBox(height: 20),
              const ForgetPasswordButton(),
            ],
          ),
        );
      },
    );
  }
}

