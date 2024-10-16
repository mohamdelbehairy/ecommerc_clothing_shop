part of 'build_app_cubit.dart';

sealed class BuildAppState {}

final class BuildAppInitial extends BuildAppState {}

final class BottomNavigationBarChanged extends BuildAppState {}

final class CategoryChanged extends BuildAppState {}
