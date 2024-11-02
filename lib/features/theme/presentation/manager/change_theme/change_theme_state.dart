part of 'change_theme_cubit.dart';

sealed class ChangeThemeState {}

final class ChangeThemeInitial extends ChangeThemeState {}

final class SaveThemeSuccess extends ChangeThemeState {}

final class AppThemeChanged extends ChangeThemeState {}

final class ChangeThemeIndex extends ChangeThemeState {}

final class ChangeThemeFailure extends ChangeThemeState {
  final String errorMessage;

  ChangeThemeFailure({required this.errorMessage});
}
