import 'package:e_clot_shop/core/utils/bloc_observer.dart';
import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'firebase_options.dart';
import 'setup_service_locator.dart';

Future<void> initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = SecretKey.stripPublishableKey;
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
