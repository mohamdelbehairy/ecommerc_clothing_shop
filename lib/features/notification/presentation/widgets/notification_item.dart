import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/order/presentation/views/order_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/background_list_tile.dart';
import '../../data/models/notification_model.dart';
import 'function/notification_text.dart';
import 'notification_list_tile_leading.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notifyModel});
  final NotificationModel notifyModel;

  @override
  Widget build(BuildContext context) {
    return BackgroundListTile(
        height: 80,
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OrderDetailsView(
                orderData: notifyModel.orderModel, isNotify: true))),
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: NotificationListTileLeading(isSeen: notifyModel.isSeen),
            title: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(notificationText(notifyModel),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.styleMedium14(context))),
          ),
        ));
  }
}
