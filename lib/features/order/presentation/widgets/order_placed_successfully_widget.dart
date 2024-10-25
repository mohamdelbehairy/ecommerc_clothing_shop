import 'package:flutter/material.dart';

import '../../../../core/models/background_model.dart';
import '../../../../core/widgets/custom_background_container.dart';
import 'order_placed_texts_and_button_section.dart';

class OrderPlacedSuccessfullyWidget extends StatelessWidget {
  const OrderPlacedSuccessfullyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBakgroundContainer(
        backgroundModel: BackgroundModel(
            padding: 32,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: const OrderPlacedTextsAndButtonSection()));
  }
}
