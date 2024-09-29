import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';
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
    return Container(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.secondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
          child: CustomButton(
              customButtonModel: CustomButtonModel(
                  onTap: () async {
                    await saveUserData.saveUserData(
                        userDataModel: UserDataModel(
                            userName: buildLogin.userName,
                            email: FirebaseAuth.instance.currentUser!.email!,
                            userId: FirebaseAuth.instance.currentUser!.uid,
                            type: tellAbout.activeIndex,
                            age: tellAbout.year));
                  },
                  buttonName: 'Finish'))),
    );
  }
}
