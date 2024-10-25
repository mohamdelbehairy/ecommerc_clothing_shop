import 'dart:developer';

import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob_egypt/flutter_paymob_egypt.dart';

void payWithPaymob(BuildContext context, num paymobPrice) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => FlutterPaymobPayment(
          cardInfo: CardInfo(
              apiKey: SecretKey.paymobApiKey,
              iframesID: SecretKey.paymobIframesID,
              integrationID: SecretKey.paymobIntegrationID),
          totalPrice: paymobPrice,
          successResult: (data) {
            log('successResult: $data');
          },
          errorResult: (error) {
            log('errorResult: $error');
          }),
    ),
  );
}
