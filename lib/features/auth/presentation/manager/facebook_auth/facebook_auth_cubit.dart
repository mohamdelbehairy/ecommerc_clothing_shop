import 'dart:developer';

import 'package:e_clot_shop/features/auth/data/repo/social_auth/social_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'facebook_auth_state.dart';

class FacebookAuthCubit extends Cubit<FacebookAuthState> {
  FacebookAuthCubit(this._socialAuthRepo) : super(FacebookAuthInitial());
  final SocialAuthRepo _socialAuthRepo;

  bool isLoading = false;
  Future<void> signInWIthFacebook() async {
    emit(FacebookAuthLoading(isLoading: true));
    final result = await _socialAuthRepo.signInWithFacebook();
    result.fold(
      (failure) {
        emit(FacebookAuthFailure(errorMessage: failure.message));
        log('error from facebook auth: ${failure.message}');
      },
      (userCredential) {
        emit(FacebookAuthSuccess());
      },
    );
  }
}
