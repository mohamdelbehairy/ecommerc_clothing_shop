part of 'get_user_data_cubit.dart';

sealed class GetUserDataState {}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataLoading extends GetUserDataState {}

final class GetUserDataSuccess extends GetUserDataState {
  final UserDataModel user;

  GetUserDataSuccess({required this.user});
}

final class GetUserDataFailure extends GetUserDataState {
  final String errorMessage;
  GetUserDataFailure({required this.errorMessage});
}
