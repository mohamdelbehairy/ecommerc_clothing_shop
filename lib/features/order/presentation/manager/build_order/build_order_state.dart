part of 'build_order_cubit.dart';

sealed class BuildOrderState {}

final class BuildOrderInitial extends BuildOrderState {}

final class OrderIndexChanged extends BuildOrderState {}

final class OrderLoading extends BuildOrderState {}

final class GetOrderSuccess extends BuildOrderState {}

final class StoreOrderSuccess extends BuildOrderState {}

final class ChangeProccessingToShippedOrder extends BuildOrderState {}

final class OrderFailure extends BuildOrderState {
  final String errorMessage;
  OrderFailure({required this.errorMessage});
}
