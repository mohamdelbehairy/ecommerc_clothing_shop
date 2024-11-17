import 'package:flutter/material.dart';

import '../../../../user_data/presentation/manager/save_user_data/save_user_data_cubit.dart';

Future<void> tellAboutButtonOnTap(
    BuildContext context, SaveUserDataCubit saveUserData) async {
  // var buildLogin = context.read<BuildAppCubit>();
  // var tellAbout = context.read<TellUsCubit>();
  // if (tellAbout.year != 0) {
  //   // await saveUserData.saveUserData(
  //   //     userDataModel: UserDataModel(
  //   //         userName: buildLogin.userName,
  //   //         email: FirebaseAuth.instance.currentUser!.email!,
  //   //         userId: FirebaseAuth.instance.currentUser!.uid,
  //   //         type: tellAbout.activeIndex,
  //   //         age: tellAbout.year));
  //   await StripRepoImpl(getIt.get<ApiService>()).createCustomer(
  //       id: FirebaseAuth.instance.currentUser!.uid, name: buildLogin.userName);
  // } else {
  //   customSnackbarWidget(context, message: 'Please select your age');
  // }
}
