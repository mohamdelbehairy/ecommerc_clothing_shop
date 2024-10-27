part of 'order_cubit.dart';

sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class SaveOrderSuccess extends OrderState {}

final class GetOrderSuccess extends OrderState {}

final class UpdateOrderSuccess extends OrderState {}

final class OrderFailure extends OrderState {
  final String errorMessage;
  OrderFailure({required this.errorMessage});
}
