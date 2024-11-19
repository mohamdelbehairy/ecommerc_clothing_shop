import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/setting/presentation/widgets/function/signout_bottom_sheet.dart';
import 'package:e_clot_shop/features/auth/data/repo/social_auth/social_auth_repo_impl.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/logout/logout_cubit.dart';
import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/show_alert_log_out_successful.dart';
import '../../../auth/data/repo/email_auth/email_auth_repo_impl.dart';
import 'signout_bottom_sheet_body.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        signOutBottomSheet(
            context: context,
            child: BlocProvider(
              create: (context) => LogoutCubit(getIt.get<EmailAuthRepoImpl>(),
                  getIt.get<SocialAuthRepoImpl>()),
              child: BlocConsumer<LogoutCubit, LogoutState>(
                listener: (context, state) async {
                  if (state is EmailLogoutSuccess ||
                      state is TwitterLogoutSuccess ||
                      state is GoogleLogoutSuccess ||
                      state is FacebookLogoutSuccess) {
                    showAlertLogoutSuccessful(context);
                    context.read<BuildAppCubit>().bottomActiveIndex = 0;
                  }
                },
                builder: (context, state) {
                  return SignOutBottomSheetBody(userData: userData);
                },
              ),
            ));
      },
      child: Text('Sign Out',
          style: Styles.styleBold16(context)
              .copyWith(color: const Color(0xffFA3636))),
    );
  }
}
