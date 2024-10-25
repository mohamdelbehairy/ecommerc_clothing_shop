part of 'currency_cubit.dart';

sealed class CurrencyState {}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencySuccess extends CurrencyState {}

final class CurrencyFailure extends CurrencyState {
  final String errorMessage;
  CurrencyFailure({required this.errorMessage});
}
