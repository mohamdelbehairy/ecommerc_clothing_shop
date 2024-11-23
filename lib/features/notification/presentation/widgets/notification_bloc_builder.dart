import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/notification/notification_cubit.dart';
import 'notification_item.dart';
import 'notification_list_empty_widget.dart';
import 'notification_state_loading_widget.dart';

class NotificationBlocBuilder extends StatelessWidget {
  const NotificationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var notify = context.read<NotificationCubit>();
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return const NotificationStateLoadingWidget();
        }
        return notify.notifyList.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: notify.notifyList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: index == 0 ? 32 : 0.0, bottom: 12),
                      child: NotificationItem(
                          notifyModel: notify.notifyList[index]));
                })
            : const NotificationListEmptyWidget();
      },
    );
  }
}
