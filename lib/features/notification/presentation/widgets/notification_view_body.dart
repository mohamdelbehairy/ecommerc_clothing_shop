import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';
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
              child: Text('Notifications',
                  style: Styles.styleBold16.copyWith(
                      color: context.read<ChangeThemeCubit>().isDarkMode
                          ? Colors.white
                          : null))),
          const SizedBox(height: 32),
          const NotificationItem()
          // const NoNotificationAndOrdersWidget(
          //     text: 'No Notification yet', image: Assets.imagesNotify)
        ],
      ),
    );
  }
}
