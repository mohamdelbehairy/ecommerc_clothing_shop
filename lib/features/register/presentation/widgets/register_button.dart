import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/cached_and_remove_user_id.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../auth/presentation/manager/email_register/email_register_cubit.dart';
import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../manager/build_register/build_register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildRegister = context.watch<BuildRegisterCubit>();
    var buildLogin = context.read<BuildAppCubit>();
    var emailRegister = context.read<EmailRegisterCubit>();
    return BlocConsumer<EmailRegisterCubit, EmailRegisterState>(
      listener: (context, state) async {
        if (state is EmailRegisterLoading) {
          emailRegister.isLoading = state.isLoading;
        }
        if (state is EmailRegisterSuccess) {
          emailRegister.isLoading = false;
          buildLogin.userName =
              '${buildRegister.firstName.text} ${buildRegister.lastName.text}';
          await CachedAndRemoveUserId.cachedRegisterUserID(
              buildLogin.userName, Constants.email);
          // ignore: use_build_context_synchronously
          GoRouter.of(context).go(AppRouter.tellAbout);
        }
        if (state is EmailRegisterFailure) {
          emailRegister.isLoading = false;
          // ignore: use_build_context_synchronously
          customSnackbarWidget(context,
              margin: const EdgeInsets.all(50), message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
            customButtonModel: CustomButtonModel(
                isLoading: emailRegister.isLoading,
                onTap: () async {
                  if (buildRegister.formKey.currentState!.validate()) {
                    buildRegister.formKey.currentState!.save();
                    await emailRegister.registerWithEmailAndPassword(
                        email: buildRegister.email.text,
                        password: buildRegister.password.text);
                  }
                },
                buttonName: 'Continue'));
      },
    );
  }
}
