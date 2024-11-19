import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/core/utils/cached_and_remove_user_id.dart';
import 'package:e_clot_shop/core/utils/is_user_data_saved.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/function/show_alert_sign_in_successful.dart';

Future<void> stateSuccessLogin(BuildContext context, String type) async {
  if (await isUserDataSaved(FirebaseAuth.instance.currentUser!.uid)) {
    await CachedAndRemoveUserId.cachedLoginUserID();
    // ignore: use_build_context_synchronously
    showAlertSignInSuccessful(context);
  } else {
    CachedAndRemoveUserId.cachedRegisterUserID(
        FirebaseAuth.instance.currentUser!.displayName != null
            ? FirebaseAuth.instance.currentUser!.displayName!
            : FirebaseAuth.instance.currentUser!.email != null
                ? FirebaseAuth.instance.currentUser!.email!
                : FirebaseAuth.instance.currentUser!.phoneNumber!,
        type);
    // ignore: use_build_context_synchronously
    GoRouter.of(context).go(AppRouter.tellAbout);
  }
}
