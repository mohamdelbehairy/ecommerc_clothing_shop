import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/notification_model.dart';
import '../../../data/repo/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notifiyRepo) : super(NotificationInitial());
  final NotificationRepo _notifiyRepo;

  Future<void> storeNotification(
      {required NotificationModel notifyModel}) async {
    emit(NotificationLoading());
    final result = await _notifiyRepo.storeNotification(notifyModel);

    result.fold((e) {
      emit(NotificationFailure(errorMessage: e.toString()));
      log('error from store notification: $e');
    }, (e) => emit(StoreNotifiySuccess()));
  }
}
