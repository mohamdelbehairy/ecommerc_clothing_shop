part of 'build_app_cubit.dart';

sealed class BuildAppState {}

final class BuildAppInitial extends BuildAppState {}

final class BottomNavigationBarChanged extends BuildAppState {}

final class CategoryChanged extends BuildAppState {}

final class QuantityChanged extends BuildAppState {}

final class BottomSheetChanged extends BuildAppState {}

final class ProductButtonTrue extends BuildAppState {}

final class ProductButtonFalse extends BuildAppState {}
