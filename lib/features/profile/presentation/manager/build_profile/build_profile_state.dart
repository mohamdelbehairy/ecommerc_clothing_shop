part of 'build_profile_cubit.dart';

@immutable
sealed class BuildProfileState {}

final class BuildProfileInitial extends BuildProfileState {}

final class ChangeIndex extends BuildProfileState {}

final class PickDateSuccess extends BuildProfileState {}
