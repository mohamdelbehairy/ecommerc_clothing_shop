import 'dart:developer';

import 'package:e_clot_shop/features/payment/data/repo/currency_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit(this._currencyRepo) : super(CurrencyInitial());

  final CurrencyRepo _currencyRepo;

  Future<String> getCurrency() async {
    emit(CurrencyLoading());
    try {
      String currency = await _currencyRepo.getCurrency();
      emit(CurrencySuccess());
      return currency;
    } catch (e) {
      emit(CurrencyFailure(errorMessage: e.toString()));
      log('error from get currency: $e');
      return '';
    }
  }
}
