part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {

  final bool isLoading;

  ForgetPasswordLoading({required this.isLoading});
}

final class ForgetPasswordSuccess extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordFailure({required this.errorMessage});
}
