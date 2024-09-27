import 'dart:developer';

import 'package:e_clot_shop/features/auth/data/repo/email_auth/email_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'email_login_state.dart';

class EmailLoginCubit extends Cubit<EmailLoginState> {
  EmailLoginCubit(this._emailAuthRepo) : super(EmailLoginInitial());

  final EmailAuthRepo _emailAuthRepo;

  bool isLoading = false;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(EmailLoginLoading(isLoading: true));
    
    final result =
        await _emailAuthRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) {
        emit(EmailLoginFailure(errorMessage: failure.message));
        log('error from sign in with email and password: ${failure.message}');
      },
      (userCredential) {
        emit(EmailLoginSuccess());
      },
    );
  }
}
