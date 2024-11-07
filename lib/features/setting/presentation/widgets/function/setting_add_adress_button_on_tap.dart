  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';


void settingAddAddressButtonOnTap(BuildContext context) {
    var textFields = context.read<BuildAppCubit>();
    if (textFields.userAddAddressFormKey.currentState!.validate()) {
      textFields.userAddAddressFormKey.currentState!.save();
      GoRouter.of(context).pop();
    }
  }