import 'dart:developer';

import 'package:e_clot_shop/features/auth/data/repo/social_auth/social_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit(this._socialAuthRepo) : super(GoogleAuthInitial());
  final SocialAuthRepo _socialAuthRepo;

  Future<void> signInWIthGoogle() async {
    emit(GoogleAuthLoading(isLoading: true));
    final result = await _socialAuthRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(GoogleAuthFailure(errorMessage: failure.message));
        log('error from google auth: ${failure.message}');
      },
      (userCredential) {
        emit(GoogleAuthSuccess());
      },
    );
  }
}
