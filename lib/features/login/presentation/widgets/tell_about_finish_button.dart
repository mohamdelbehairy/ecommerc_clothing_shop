import 'package:e_clot_shop/core/widgets/function/show_alert_sign_in_successful.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../user_data/data/models/user_data_model.dart';
import '../../../user_data/presentation/manager/save_user_data/save_user_data_cubit.dart';
import '../manager/build_login/build_login_cubit.dart';
import '../manager/tell_us/tell_us_cubit.dart';

class TellAboutFinshButton extends StatelessWidget {
  const TellAboutFinshButton({super.key});

  @override
  Widget build(BuildContext context) {
    var tellAbout = context.read<TellUsCubit>();
    var buildLogin = context.read<BuildLoginCubit>();
    var saveUserData = context.read<SaveUserDataCubit>();
    return BlocConsumer<SaveUserDataCubit, SaveUserDataState>(
      listener: (context, state) {
        if (state is SaveUserDataLoading) {
          saveUserData.isLoading = state.isLoading;
        }
        if (state is SaveUserDataSuccess) {
          saveUserData.isLoading = false;
          showAlertSignInSuccessful(context);
        }
        if (state is SaveUserDataFailure) {
          saveUserData.isLoading = false;
          customSnackbarWidget(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Container(
          height: 100,
          width: MediaQuery.sizeOf(context).width,
          color: AppColors.secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
              child: CustomButton(
                  customButtonModel: CustomButtonModel(
                      isLoading: saveUserData.isLoading,
                      onTap: () async {
                        if (tellAbout.year != 0) {
                          await saveUserData.saveUserData(
                              userDataModel: UserDataModel(
                                  userName: buildLogin.userName,
                                  email:
                                      FirebaseAuth.instance.currentUser!.email!,
                                  userId:
                                      FirebaseAuth.instance.currentUser!.uid,
                                  type: tellAbout.activeIndex,
                                  age: tellAbout.year));
                        } else {
                          customSnackbarWidget(context,
                              message: 'Please select your age');
                        }
                      },
                      buttonName: 'Finish'))),
        );
      },
    );
  }
}
