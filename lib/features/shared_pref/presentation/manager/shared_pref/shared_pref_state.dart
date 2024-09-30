part of 'shared_pref_cubit.dart';

sealed class SharedPrefState {}

final class SharedPrefInitial extends SharedPrefState {}

final class SharedPrefGetBoolSuccess extends SharedPrefState {}

final class SharedPrefGetStringSuccess extends SharedPrefState {}
