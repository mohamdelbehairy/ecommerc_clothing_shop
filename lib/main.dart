import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'core/utils/init_main.dart';
import 'features/app/presentation/widgets/e_clot_shop.dart';

void main() async {
  await initMain();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const EClotShop(),
  ));
}