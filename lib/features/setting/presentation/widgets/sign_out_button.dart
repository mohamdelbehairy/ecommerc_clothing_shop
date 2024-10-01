import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/function/custom_bottom_sheet.dart';
import 'package:e_clot_shop/features/auth/data/repo/social_auth/social_auth_repo_impl.dart';
import 'package:e_clot_shop/features/auth/presentation/manager/logout/logout_cubit.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/function/show_alert_log_out_successful.dart';
import '../../../auth/data/repo/email_auth/email_auth_repo_impl.dart';
import '../../../bottom_navigation_bar/presentation/manager/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'logout_bottom_sheet_body.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customBottomSheet(
            context: context,
            child: BlocProvider(
              create: (context) => LogoutCubit(getIt.get<EmailAuthRepoImpl>(),
                  getIt.get<SocialAuthRepoImpl>()),
              child: BlocConsumer<LogoutCubit, LogoutState>(
                listener: (context, state) async {
                  if (state is EmailLogoutSuccess ||
                      state is GoogleLogoutSuccess ||
                      state is FacebookLogoutSuccess) {
                    showAlertLogoutSuccessful(context);
                    context.read<BottomNavigationBarCubit>().activeIndex = 0;
                  }
                },
                builder: (context, state) {
                  return LogoutBottomSheetBody(userData: userData);
                },
              ),
            ));
      },
      child: Text('Sign Out',
          style: Styles.styleBold16.copyWith(color: const Color(0xffFA3636))),
    );
  }
}
