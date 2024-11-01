part of 'update_user_data_cubit.dart';

sealed class UpdateUserDataState {}

final class UpdateUserDataInitial extends UpdateUserDataState {}

final class UpdateUserDataLoading extends UpdateUserDataState {}

final class UpdateUserDataSuccess extends UpdateUserDataState {}

final class UpdateUserDataFailure extends UpdateUserDataState {
  final String errorMessage;

  UpdateUserDataFailure({required this.errorMessage});
}
