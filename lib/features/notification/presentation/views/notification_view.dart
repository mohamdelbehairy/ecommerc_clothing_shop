import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/notification_repo_impl.dart';
import '../manager/notification/notification_cubit.dart';
import '../widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(getIt.get<NotificationRepoImpl>()),
      child: const Scaffold(
        body: NotificationViewBody(),
      ),
    );
  }
}
