import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/strip_input_model.dart';
import '../../manager/strip/strip_payment_cubit.dart';

Future<void> payWithCard(BuildContext context,
    {required num totalPrice}) async {
  await context.read<StripPaymentCubit>().makePayment(
      stripInputModel: StripInputModel(
          isDark: context.read<BuildAppCubit>().isDarkMode ? true : false,
          amount: (totalPrice * 100).toInt(),
          customer: FirebaseAuth.instance.currentUser!.uid));
}
