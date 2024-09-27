import 'dart:developer';

import 'package:e_clot_shop/features/auth/data/repo/email_auth/email_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'email_register_state.dart';

class EmailRegisterCubit extends Cubit<EmailRegisterState> {
  EmailRegisterCubit(this._emailAuthRepo) : super(EmailRegisterInitial());

  final EmailAuthRepo _emailAuthRepo;
  
  bool isLoading = false;
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(EmailRegisterLoading(isLoading: true));

    final result =
        await _emailAuthRepo.registerWithEmailAndPassword(email, password);
    result.fold(
      (failure) {
        emit(EmailRegisterFailure(errorMessage: failure.message));
        log('error from email auth: ${failure.message}');
      },
      (userCredential) {
        emit(EmailRegisterSuccess());
      },
    );
  }
}
