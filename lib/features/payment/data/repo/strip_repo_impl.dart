import 'package:e_clot_shop/core/utils/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../models/strip_input_model.dart';
import 'strip_repo.dart';

class StripRepoImpl extends StripRepo {
  final ApiService _apiService;

  StripRepoImpl(this._apiService);

  @override
  Future<String> createPaymentIntent(StripInputModel stripInputModel) async {
    final response = await _apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      data: stripInputModel.toJson(),
    );

    return response.data['client_secret'];
  }

  @override
  Future<void> initPaymentSheet({required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'E-Clot Shop',
      paymentIntentClientSecret: clientSecret,
      style: ThemeMode.light,
    ));
  }

  @override
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  @override
  Future<void> makePayment(StripInputModel stripInputModel) async {
    var clientSecret = await createPaymentIntent(stripInputModel);
    await initPaymentSheet(clientSecret: clientSecret);
    await displayPaymentSheet();
  }
}
