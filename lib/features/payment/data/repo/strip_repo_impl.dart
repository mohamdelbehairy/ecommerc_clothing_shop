import 'package:e_clot_shop/core/utils/api_service.dart';
import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../models/strip_input_model.dart';
import 'strip_repo.dart';

class StripRepoImpl extends StripRepo {
  final ApiService _apiService;

  StripRepoImpl(this._apiService);

  Future<String> _createPaymentIntent(StripInputModel stripInputModel) async {
    final response = await _apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      data: stripInputModel.toJson(),
    );

    return response.data['client_secret'];
  }

  Future<void> _initPaymentSheet(
      {required String clientSecret,
      required String customer,
      required String ephemeralKey,
      bool isDark = false}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'E-Clot Shop',
      paymentIntentClientSecret: clientSecret,
      customerId: customer,
      customerEphemeralKeySecret: ephemeralKey,
      style: isDark ? ThemeMode.dark : ThemeMode.light,
    ));
  }

  Future<void> _displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<String> _createEphemeralKey(String customer) async {
    final response = await _apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      data: {
        'customer': customer,
      },
      headers: {
        'Stripe-Version': '2024-06-20',
        'Authorization': 'Bearer ${SecretKey.stripeSecretKey}',
      },
    );

    return response.data['secret'];
  }

  @override
  Future<void> makePayment(StripInputModel stripInputModel) async {
    var clientSecret = await _createPaymentIntent(stripInputModel);
    var ephemeralKey = await _createEphemeralKey(stripInputModel.customer);
    await _initPaymentSheet(
        isDark: stripInputModel.isDark,
        clientSecret: clientSecret,
        customer: stripInputModel.customer,
        ephemeralKey: ephemeralKey);
    await _displayPaymentSheet();
  }

  @override
  Future<void> createCustomer(
      {required String id, required String name}) async {
    await _apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      data: {
        'id': id,
        'name': name,
      },
    );
  }
}
