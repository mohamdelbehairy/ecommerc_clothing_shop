part of 'strip_payment_cubit.dart';

sealed class StripPaymentState {}

final class StripPaymentInitial extends StripPaymentState {}

class StripPaymentLoading extends StripPaymentState {}

class StripPaymentSuccess extends StripPaymentState {}

class StripPaymentFailure extends StripPaymentState {
  final String errorMessage;

  StripPaymentFailure({required this.errorMessage});
}
