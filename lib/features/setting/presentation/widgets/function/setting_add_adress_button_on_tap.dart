import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/update/presentation/manager/update_data/update_data_cubit.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';

void settingAddAddressButtonOnTap(
    BuildContext context, UserDataModel userData) async {
  var textFields = context.read<BuildAppCubit>();
  if (textFields.userAddAddressFormKey.currentState!.validate()) {
    textFields.userAddAddressFormKey.currentState!.save();

    if (userData.shippingAddress != null) {
      List<String> list = [];

      for (var element in userData.shippingAddress!.split(', ')) {
        list.add(element);
      }

      if (list[0] != textFields.userStreetAddress.text ||
          list[1] != textFields.userCity.text ||
          list[2] != textFields.userStateTextEditing.text ||
          list[3] != textFields.userZipCode.text) {
        await context.read<UpdateDataCubit>().updateUserData(
            key: Constants.shippingAddress,
            value:
                '${textFields.userStreetAddress.text}, ${textFields.userCity.text}, ${textFields.userStateTextEditing.text}, ${textFields.userZipCode.text}');
      }
    } else {
      await context.read<UpdateDataCubit>().updateUserData(
          key: Constants.shippingAddress,
          value:
              '${textFields.userStreetAddress.text}, ${textFields.userCity.text}, ${textFields.userStateTextEditing.text}, ${textFields.userZipCode.text}');
    }
  }
}
