part of 'notification_cubit.dart';

sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class StoreNotifiySuccess extends NotificationState {}

final class GetNotifiySuccess extends NotificationState {}

final class NotificationFailure extends NotificationState {
  final String errorMessage;

  NotificationFailure({required this.errorMessage});
}
