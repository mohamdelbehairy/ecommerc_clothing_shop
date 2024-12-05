import 'package:flutter/material.dart';
import 'core/utils/init_main.dart';
import 'features/app/presentation/widgets/e_clot_shop.dart';

void main() async {
  await initMain();
  runApp(const EClotShop());
}