import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/cached_and_remove_user_id.dart';
import 'package:e_clot_shop/core/utils/is_user_data_saved.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../../core/widgets/function/show_alert_sign_in_successful.dart';
import '../../../auth/presentation/manager/email_login/email_login_cubit.dart';
import '../../../../core/manager/build_app/build_app_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var buildLogin = context.watch<BuildAppCubit>();
    var emailLogin = context.read<EmailLoginCubit>();
    return BlocConsumer<EmailLoginCubit, EmailLoginState>(
      listener: (context, state) async {
        if (state is EmailLoginLoading) {
          emailLogin.isLoading = state.isLoading;
        }
        if (state is EmailLoginSuccess) {
          await stateSuccessCode(context);
          buildLogin.email.clear();
          buildLogin.password.clear();
          emailLogin.isLoading = false;
        }
        if (state is EmailLoginFailure) {
          emailLogin.isLoading = false;
          // ignore: use_build_context_synchronously
          customSnackbarWidget(context,
              margin: const EdgeInsets.all(50), message: state.errorMessage);
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

  Future<void> stateSuccessCode(BuildContext context) async {
    if (await isUserDataSaved(FirebaseAuth.instance.currentUser!.uid)) {
      await CachedAndRemoveUserId.cachedLoginUserID();
      // ignore: use_build_context_synchronously
      showAlertSignInSuccessful(context);
    } else {
      CachedAndRemoveUserId.cachedRegisterUserID(
          FirebaseAuth.instance.currentUser!.email != null
              ? FirebaseAuth.instance.currentUser!.email!
              : FirebaseAuth.instance.currentUser!.phoneNumber!);
      // ignore: use_build_context_synchronously
      GoRouter.of(context).go(AppRouter.tellAbout);
    }
  }
}
