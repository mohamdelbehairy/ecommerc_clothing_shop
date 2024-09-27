import 'package:e_clot_shop/core/models/custom_button_model.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../manager/build_forget_password/build_forget_password_cubit.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildForgetPassword = context.watch<BuildForgetPasswordCubit>();
    var forgetPassword = context.read<ForgetPasswordCubit>();
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          forgetPassword.isLoading = state.isLoading;
        }
        if (state is ForgetPasswordSuccess) {
          GoRouter.of(context).push(AppRouter.checkEmail);
          forgetPassword.isLoading = false;
        }
        if (state is ForgetPasswordFailure) {
          forgetPassword.isLoading = false;
          customSnackbarWidget(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
            customButtonModel: CustomButtonModel(
                isLoading: forgetPassword.isLoading,
                onTap: () async {
                  if (buildForgetPassword.formKey.currentState!.validate()) {
                    buildForgetPassword.formKey.currentState!.save();
                    await forgetPassword.forgetPassword(
                        email: buildForgetPassword.email.text);
                  }
                },
                buttonName: 'Continue'));
      },
    );
  }
}
