part of 'save_user_data_cubit.dart';

sealed class SaveUserDataState {}

final class SaveUserDataInitial extends SaveUserDataState {}

final class SaveUserDataLoading extends SaveUserDataState {
  final bool isLoading;

  SaveUserDataLoading({required this.isLoading});
}

final class SaveUserDataSuccess extends SaveUserDataState {}

final class SaveUserDataFailure extends SaveUserDataState {
  final String errorMessage;

  SaveUserDataFailure({required this.errorMessage});
}
