import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/strip_input_model.dart';
import '../../manager/strip/strip_payment_cubit.dart';

Future<void> payWithCard(BuildContext context,
    {required num totalPrice}) async {
  await context.read<StripPaymentCubit>().makePayment(
      stripInputModel: StripInputModel(amount: (totalPrice * 100).toInt()));
}
