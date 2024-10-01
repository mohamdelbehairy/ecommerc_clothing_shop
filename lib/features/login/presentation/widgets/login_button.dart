import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../../core/widgets/function/show_alert_sign_in_successful.dart';
import '../../../auth/presentation/manager/email_login/email_login_cubit.dart';
import '../manager/build_login/build_login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildLogin = context.watch<BuildLoginCubit>();
    var emailLogin = context.read<EmailLoginCubit>();
    return BlocConsumer<EmailLoginCubit, EmailLoginState>(
      listener: (context, state) {
        if (state is EmailLoginLoading) {
          emailLogin.isLoading = state.isLoading;
        }
        if (state is EmailLoginSuccess) {
          emailLogin.isLoading = false;
          showAlertSignInSuccessful(context);
          buildLogin.email.clear();
          buildLogin.password.clear();
        }
        if (state is EmailLoginFailure) {
          emailLogin.isLoading = false;
          customSnackbarWidget(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
            customButtonModel: CustomButtonModel(
                isLoading: emailLogin.isLoading,
                onTap: () async {
                  if (buildLogin.formKeyTwo.currentState!.validate()) {
                    buildLogin.formKeyTwo.currentState!.save();
                    await emailLogin.signInWithEmailAndPassword(
                        email: buildLogin.email.text,
                        password: buildLogin.password.text);
                  }
                },
                buttonName: 'Continue'));
      },
    );
  }
}
