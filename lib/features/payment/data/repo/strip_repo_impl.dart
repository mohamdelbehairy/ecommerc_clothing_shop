import 'package:e_clot_shop/core/utils/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'strip_repo.dart';

class StripRepoImpl extends StripRepo {
  final ApiService _apiService;

  StripRepoImpl(this._apiService);

  @override
  Future<String> createPaymentIntent() async {
    final response = await _apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      data: {
        'amount': 1099,
        'currency': 'usd',
      },
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
  Future<void> makePayment() async {
    var clientSecret = await createPaymentIntent();
    await initPaymentSheet(clientSecret: clientSecret);
    await displayPaymentSheet();
  }
}
