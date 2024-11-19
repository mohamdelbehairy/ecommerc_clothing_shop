import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/setup_service_locator.dart';
import '../../../../../core/widgets/function/custom_snack_bar_widget.dart';
import '../../../../payment/data/repo/strip_repo_impl.dart';
import '../../../../shared_pref/presentation/manager/shared_pref/shared_pref_cubit.dart';
import '../../../../user_data/data/models/user_data_model.dart';
import '../../../../user_data/presentation/manager/save_user_data/save_user_data_cubit.dart';
import '../../manager/tell_us/tell_us_cubit.dart';

Future<void> tellAboutButtonOnTap(
    BuildContext context, SaveUserDataCubit saveUserData) async {
  var buildLogin = context.read<BuildAppCubit>();
  var tellAbout = context.read<TellUsCubit>();
  var list = await context.read<SharedPrefCubit>().getListString();
  if (tellAbout.year != 0) {
    await saveUserData.saveUserData(
        userDataModel: UserDataModel(
            userId:
                list != null ? list[0] : FirebaseAuth.instance.currentUser!.uid,
            email: list != null
                ? list[1]
                : FirebaseAuth.instance.currentUser!.email!,
            userName: list != null ? list[2] : buildLogin.userName,
            userImage: list != null ? list[3] : Constants.defaultUserImageUrl,
            authType: list![4],
            type: tellAbout.activeIndex,
            age: tellAbout.year,
            dateTime: tellAbout.date));
    await StripRepoImpl(getIt.get<ApiService>()).createCustomer(
        id: FirebaseAuth.instance.currentUser!.uid, name: buildLogin.userName);
  } else {
    // ignore: use_build_context_synchronously
    customSnackbarWidget(context,
        message: 'Please select your age', width: 200);
  }
}
