part of 'build_setting_cubit.dart';

sealed class BuildSettingState {}

final class BuildSettingInitial extends BuildSettingState {}

final class LaunchEmailSuccess extends BuildSettingState {}

final class LaunchUrlFailure extends BuildSettingState {
  final String errorMessage;
  LaunchUrlFailure({required this.errorMessage});
}
