part of 'google_auth_cubit.dart';

sealed class GoogleAuthState {}

final class GoogleAuthInitial extends GoogleAuthState {}

final class GoogleAuthLoading extends GoogleAuthState {
  final bool isLoading;

  GoogleAuthLoading({required this.isLoading});
}

final class GoogleAuthSuccess extends GoogleAuthState {}

final class GoogleAuthFailure extends GoogleAuthState {
  final String errorMessage;

  GoogleAuthFailure({required this.errorMessage});
}
