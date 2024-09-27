import 'dart:developer';

import 'package:e_clot_shop/features/auth/data/repo/email_auth/email_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._emailAuthRepo) : super(ForgetPasswordInitial());

  final EmailAuthRepo _emailAuthRepo;

  bool isLoading = false;
  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading(isLoading: true));

    final result = await _emailAuthRepo.forgetPassword(email);
    result.fold(
      (failure) {
        emit(ForgetPasswordFailure(errorMessage: failure.message));
        log('error from forget password: ${failure.message}');
      },
      (success) {
        emit(ForgetPasswordSuccess());
      },
    );
  }
}
