import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/custom_button.dart';

class NoNotificationYetWidget extends StatelessWidget {
  const NoNotificationYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          const Spacer(),
          Image.asset(Assets.imagesNotify),
          const SizedBox(height: 24),
          Text('No Notification yet', style: Styles.styleMedium24),
          const SizedBox(height: 24),
          CustomButton(
              customButtonModel: CustomButtonModel(
                  width: 185, buttonName: 'Explore Categories')),
          const Spacer(),
        ],
      ),
    );
  }
}
