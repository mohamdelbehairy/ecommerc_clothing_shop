import 'package:e_clot_shop/core/utils/bloc_observer.dart';
import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/app/presentation/widgets/e_clot_shop.dart';
import 'firebase_options.dart';
import 'set_system_setting.dart';
import 'setup_service_locator.dart';

Future<void> initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  Stripe.publishableKey = SecretKey.stripPublishableKey;

  setupServiceLocator();
  setSystemSetting();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const EClotShop());
}
