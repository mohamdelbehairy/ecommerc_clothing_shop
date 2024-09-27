import 'package:e_clot_shop/core/utils/firebase_options.dart';
import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/bloc_observer.dart';
import 'core/widgets/e_clot_shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const EClotShop());
}
