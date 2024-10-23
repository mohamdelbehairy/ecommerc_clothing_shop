import 'dart:developer';

import 'package:e_clot_shop/features/payment/data/repo/strip_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'strip_payment_state.dart';

class StripPaymentCubit extends Cubit<StripPaymentState> {
  StripPaymentCubit(this._stripRepo) : super(StripPaymentInitial());

  final StripRepo _stripRepo;

  Future<void> makePayment() async {
    emit(StripPaymentLoading());
    try {
      await _stripRepo.makePayment();
      emit(StripPaymentSuccess());
    } catch (e) {
      emit(StripPaymentFailure(errorMessage: e.toString()));
      log('error from strip payment: $e');
    }
  }
}
