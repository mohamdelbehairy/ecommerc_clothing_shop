part of 'facebook_auth_cubit.dart';

sealed class FacebookAuthState {}

final class FacebookAuthInitial extends FacebookAuthState {}

final class FacebookAuthLoading extends FacebookAuthState {
  final bool isLoading;

  FacebookAuthLoading({required this.isLoading});
}

final class FacebookAuthSuccess extends FacebookAuthState {}

final class FacebookAuthFailure extends FacebookAuthState {
  final String errorMessage;

  FacebookAuthFailure({required this.errorMessage});
}
