import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/no_notification_and_orders_widget.dart';

class NotificationListEmptyWidget extends StatelessWidget {
  const NotificationListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoNotificationAndOrdersWidget(
        text: 'No Notification yet', image: Assets.imagesNotify);
  }
}
