import 'dart:developer';

import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob_egypt/flutter_paymob_egypt.dart';

void payWithPaymob(BuildContext context, num totalPrice) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => FlutterPaymobPayment(
          cardInfo: CardInfo(
              apiKey: SecretKey.paymobApiKey,
              iframesID: SecretKey.paymobIframesID,
              integrationID: SecretKey.paymobIntegrationID),
          totalPrice: totalPrice,
          successResult: (data) {
            log('successResult: $data');
          },
          errorResult: (error) {
            log('errorResult: $error');
          }),
    ),
  );
}
