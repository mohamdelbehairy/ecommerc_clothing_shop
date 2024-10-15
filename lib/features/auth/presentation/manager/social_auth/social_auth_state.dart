part of 'social_auth_cubit.dart';

sealed class SocialAuthState {}

final class SocialAuthInitial extends SocialAuthState {}

final class TwitterAuthLoading extends SocialAuthState {
  final bool isLoading;

  TwitterAuthLoading({required this.isLoading});
}

final class GoogleAuthLoading extends SocialAuthState {
  final bool isLoading;

  GoogleAuthLoading({required this.isLoading});
}

final class FacebookAuthLoading extends SocialAuthState {
  final bool isLoading;

  FacebookAuthLoading({required this.isLoading});
}

final class TwitterAuthSuccess extends SocialAuthState {}

final class GoogleAuthSuccess extends SocialAuthState {}

final class FacebookAuthSuccess extends SocialAuthState {}

final class SocialAuthFailure extends SocialAuthState {
  final String errorMessage;

  SocialAuthFailure({required this.errorMessage});
}
