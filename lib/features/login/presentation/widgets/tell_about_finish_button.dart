import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/cached_and_remove_user_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../../core/widgets/function/show_alert_sign_in_successful.dart';
import '../../../user_data/presentation/manager/save_user_data/save_user_data_cubit.dart';
import 'function/tell_about_button_on_tap.dart';

class TellAboutFinshButton extends StatelessWidget {
  const TellAboutFinshButton({super.key});

  @override
  Widget build(BuildContext context) {
    var saveUserData = context.read<SaveUserDataCubit>();

    return BlocConsumer<SaveUserDataCubit, SaveUserDataState>(
      listener: (context, state) async {
        if (state is SaveUserDataLoading) {
          saveUserData.isLoading = state.isLoading;
        }
        if (state is SaveUserDataSuccess) {
          saveUserData.isLoading = false;
          await CachedAndRemoveUserId.removeRegisterUserID();
          // ignore: use_build_context_synchronously
          showAlertSignInSuccessful(context);
        }
        if (state is SaveUserDataFailure) {
          saveUserData.isLoading = false;
          // ignore: use_build_context_synchronously
          customSnackbarWidget(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Container(
          height: 100,
          width: MediaQuery.sizeOf(context).width,
          color: context.read<BuildAppCubit>().isDarkMode
              ? AppColors.darkModeSecondryColor
              : AppColors.secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
              child: CustomButton(
                  customButtonModel: CustomButtonModel(
                      isLoading: saveUserData.isLoading,
                      onTap: () async {
                        await tellAboutButtonOnTap(context, saveUserData);
                      },
                      buttonName: 'Finish'))),
        );
      },
    );
  }
}
