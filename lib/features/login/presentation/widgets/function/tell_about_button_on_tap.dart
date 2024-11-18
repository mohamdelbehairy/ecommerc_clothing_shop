import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/setup_service_locator.dart';
import '../../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../../payment/data/repo/strip_repo_impl.dart';
import '../../../../user_data/data/models/user_data_model.dart';
import '../../../../user_data/presentation/manager/save_user_data/save_user_data_cubit.dart';
import '../../manager/tell_us/tell_us_cubit.dart';

Future<void> tellAboutButtonOnTap(
    BuildContext context, SaveUserDataCubit saveUserData) async {
  var buildLogin = context.read<BuildAppCubit>();
  var tellAbout = context.read<TellUsCubit>();
  if (tellAbout.year != 0) {
    await saveUserData.saveUserData(
        userDataModel: UserDataModel(
            userName: buildLogin.userName,
            email: FirebaseAuth.instance.currentUser!.email!,
            userId: FirebaseAuth.instance.currentUser!.uid,
            type: tellAbout.activeIndex,
            age: tellAbout.year,
            dateTime: tellAbout.date));
    await StripRepoImpl(getIt.get<ApiService>()).createCustomer(
        id: FirebaseAuth.instance.currentUser!.uid, name: buildLogin.userName);
  } else {
    customSnackbarWidget(context, message: 'Please select your age');
  }
}
