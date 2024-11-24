import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/notification_model.dart';
import '../../../data/repo/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notifiyRepo) : super(NotificationInitial()) {
    _getNotification();
  }
  final NotificationRepo _notifiyRepo;

  List<NotificationModel> notifyList = [];

  void _getNotification() async {
    emit(NotificationLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
      _notifiyRepo.getNotification((snapshot) {
        notifyList = [];
        for (var element in snapshot.docs) {
          notifyList.add(NotificationModel.fromJson(element.data()));
        }
        emit(GetNotifiySuccess());
      });
    } catch (e) {
      emit(NotificationFailure(errorMessage: e.toString()));
      log('error from get notification: $e');
    }
  }
}
