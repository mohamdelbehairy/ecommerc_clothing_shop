import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import 'dont_have_account_and_create_one.dart';

class LoginTextFieldAndButtonsSection extends StatelessWidget {
  const LoginTextFieldAndButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var buildLogin = context.read<BuildAppCubit>();
    return BlocBuilder<BuildAppCubit, BuildAppState>(
      builder: (context, state) {
        return Form(
          key: buildLogin.formKeyOne,
          child: Column(
            children: [
              CustomTextField(textFieldModel: buildLogin.loginTextFields[0]),
              const SizedBox(height: 20),
              CustomButton(
                  customButtonModel: CustomButtonModel(
                      onTap: () {
                        if (buildLogin.formKeyOne.currentState!.validate()) {
                          buildLogin.formKeyOne.currentState!.save();
                          GoRouter.of(context).push(AppRouter.loginPassword);
                        }
                      },
                      buttonName: 'Continue')),
              const SizedBox(height: 20),
              const DontHaveAccountAndCreateOne(),
            ],
          ),
        );
      },
    );
  }
}
