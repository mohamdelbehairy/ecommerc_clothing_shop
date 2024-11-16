import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../data/on_boardring_model.dart';

class OnBoardringItem extends StatelessWidget {
  const OnBoardringItem({super.key, required this.onBoardringModel});
  final OnBoardringModel onBoardringModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Align(
              alignment: Alignment.center,
              child: Image.asset(onBoardringModel.image, height: 300)),
          const SizedBox(height: 30),
          Text(onBoardringModel.header,
              style: Styles.styleSmeiBoldPoppins20(context)),
          Text(onBoardringModel.body,
              style: Styles.styleSmeiBoldPoppins16(context))
        ],
      ),
    );
  }
}
