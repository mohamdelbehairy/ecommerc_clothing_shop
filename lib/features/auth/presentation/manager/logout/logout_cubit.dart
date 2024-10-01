import 'dart:developer';

import 'package:e_clot_shop/features/auth/data/repo/social_auth/social_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/email_auth/email_auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._emailAuthRepo, this._socialAuthRepo)
      : super(LogoutInitial());
  final EmailAuthRepo _emailAuthRepo;
  final SocialAuthRepo _socialAuthRepo;

  Future<void> emailLogout() async {
    emit(LogoutLoading());
    final result = await _emailAuthRepo.emailLogout();

    result.fold(
      (failure) {
        emit(LogoutFailure(errorMessage: failure.message));
        log('error from email logout: ${failure.message}');
      },
      (success) {
        emit(EmailLogoutSuccess());
      },
    );
  }

  Future<void> googleLogout() async {
    emit(LogoutLoading());
    final result = await _socialAuthRepo.googleLogout();
    result.fold(
      (failure) {
        emit(LogoutFailure(errorMessage: failure.message));
        log('error from google logout: ${failure.message}');
      },
      (success) {
        emit(GoogleLogoutSuccess());
      },
    );
  }

  Future<void> facebookLogout() async {
    emit(LogoutLoading());
    final result = await _socialAuthRepo.facebookLogout();
    result.fold(
      (failure) {
        emit(LogoutFailure(errorMessage: failure.message));
        log('error from facebook logout: ${failure.message}');
      },
      (success) {
        emit(FacebookLogoutSuccess());
      },
    );
  }
}
