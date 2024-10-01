import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/email_auth/email_auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._emailAuthRepo) : super(LogoutInitial());
  final EmailAuthRepo _emailAuthRepo;

  Future<void> emailLogout() async {
    emit(LogoutLoading());
    final result = await _emailAuthRepo.emailLogout();

    result.fold(
      (failure) {
        emit(LogoutFailure(errorMessage: failure.message));
        log('error from logout: ${failure.message}');
      },
      (success) {
        emit(EmailLogoutSuccess());
      },
    );
  }
}
