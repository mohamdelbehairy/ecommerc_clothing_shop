part of 'update_data_cubit.dart';

sealed class UpdateDataState {}

final class UpdateDataInitial extends UpdateDataState {}

final class UpdateDataLoading extends UpdateDataState {}

final class UpdateUserDataSuccess extends UpdateDataState {}

final class UpdateProductDataSuccess extends UpdateDataState {}

final class UpdateDataFailure extends UpdateDataState {
  final String errorMessage;

  UpdateDataFailure({required this.errorMessage});
}
