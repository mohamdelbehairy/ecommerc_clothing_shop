part of 'email_register_cubit.dart';

sealed class EmailRegisterState {}

final class EmailRegisterInitial extends EmailRegisterState {}

final class EmailRegisterLoading extends EmailRegisterState {
  final bool isLoading;

  EmailRegisterLoading({required this.isLoading});
}


final class EmailRegisterSuccess extends EmailRegisterState {}


final class EmailRegisterFailure extends EmailRegisterState {
  final String errorMessage;

  EmailRegisterFailure({required this.errorMessage});
}

