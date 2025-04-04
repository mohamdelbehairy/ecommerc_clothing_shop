part of 'build_app_cubit.dart';

sealed class BuildAppState {}

final class BuildAppInitial extends BuildAppState {}

final class BottomNavigationBarChanged extends BuildAppState {}

final class IndexChanged extends BuildAppState {}

final class ProductButtonTrue extends BuildAppState {}

final class ProductButtonFalse extends BuildAppState {}

final class ResetOrder extends BuildAppState {}

final class CouponSussess extends BuildAppState {}

final class ClearFilterBottomSheet extends BuildAppState {}

final class ClearUserTextField extends BuildAppState {}

final class SharedPrefGetBoolSuccess extends BuildAppState {}

final class SharedPrefGetStringSuccess extends BuildAppState {}

final class SharedPrefGetListSuccess extends BuildAppState {}

final class AppThemeChanged extends BuildAppState {}

final class ChangeThemeFailure extends BuildAppState {
  final String errorMessage;

  ChangeThemeFailure({required this.errorMessage});
}


final class ChangeDialogState extends BuildAppState {}

