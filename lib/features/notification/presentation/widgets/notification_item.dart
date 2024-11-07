import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/background_list_tiled.dart';
import 'notification_list_tile_leading.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundListTile(
        height: 80,
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const NotificationListTileLeading(),
            title: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                    'Gilbert, you placed and order check your order history for full details.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.styleMedium12(context))),
          ),
        ));
  }
}
