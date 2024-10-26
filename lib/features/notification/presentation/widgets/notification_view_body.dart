import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/no_notification_and_orders_widget.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 63),
        Center(child: Text('Notifications', style: Styles.styleBold16)),
        const NoNotificationAndOrdersWidget(
            text: 'No Notification yet', image: Assets.imagesNotify)
      ],
    );
  }
}
