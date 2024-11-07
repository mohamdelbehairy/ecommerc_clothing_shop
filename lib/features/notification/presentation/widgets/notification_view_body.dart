  import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'notification_item.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 63),
          Center(
              child: Text('Notifications', style: Styles.styleBold16(context))),
          const SizedBox(height: 32),
          const NotificationItem()
          // const NoNotificationAndOrdersWidget(
          //     text: 'No Notification yet', image: Assets.imagesNotify)
        ],
      ),
    );
  }
}
