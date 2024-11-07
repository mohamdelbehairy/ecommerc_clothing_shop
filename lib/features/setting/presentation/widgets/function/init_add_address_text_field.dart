import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/manager/build_app/build_app_cubit.dart';


void initUserAddAdressTextField(BuildContext context, String? shippingAddress) {
    var buildApp = context.read<BuildAppCubit>();

    List<String> list = [];
    if (shippingAddress != null) {
      for (var element in shippingAddress.split(', ')) {
        list.add(element);
      }
      buildApp.userStreetAddress.text = list[0];
      buildApp.userCity.text = list[1];
      buildApp.userStateTextEditing.text = list[2];
      buildApp.userZipCode.text = list[3];
    }
  }