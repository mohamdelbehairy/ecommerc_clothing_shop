import 'dart:developer';

import 'package:e_clot_shop/features/auth/data/repo/social_auth/social_auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'social_auth_state.dart';

class SocialAuthCubit extends Cubit<SocialAuthState> {
  SocialAuthCubit(this._socialAuthRepo) : super(SocialAuthInitial());
  final SocialAuthRepo _socialAuthRepo;

  bool isLoadingTwitter = false;
  bool isLoadingGoogle = false;
  bool isLoadingGithub = false;
  bool isLoadingFacebook = false;
  Future<void> signInWithTwitter() async {
    emit(TwitterAuthLoading(isLoading: true));
    final result = await _socialAuthRepo.signInWithTwitter();
    result.fold((failure) {
      emit(SocialAuthFailure(errorMessage: failure.message));
      log('error from twitter auth: ${failure.message}');
    }, (userCredential) {
      if (userCredential.user != null) {
        emit(TwitterAuthSuccess());
      }
    });
  }

  Future<void> signInWIthGoogle() async {
    emit(GoogleAuthLoading(isLoading: true));
    final result = await _socialAuthRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(SocialAuthFailure(errorMessage: failure.message));
        log('error from google auth: ${failure.message}');
      },
      (userCredential) {
        if (userCredential.user != null) {
          emit(GoogleAuthSuccess());
        }
      },
    );
  }

  Future<void> signInWithGithub(BuildContext context) async {
    emit(GithubAuthLoading(isLoading: true));
    final result = await _socialAuthRepo.signInWithGithub(context);
    result.fold(
      (failure) {
        emit(SocialAuthFailure(errorMessage: failure.message));
        log('error from github auth: ${failure.message}');
      },
      (userCredential) {
        if (userCredential.user != null) {
          emit(GithubAuthSuccess());
        }
      },
    );
  }

  // Future<void> signInWIthFacebook() async {
  //   emit(FacebookAuthLoading(isLoading: true));
  //   final result = await _socialAuthRepo.signInWithFacebook();
  //   result.fold(
  //     (failure) {
  //       emit(SocialAuthFailure(errorMessage: failure.message));
  //       log('error from facebook auth: ${failure.message}');
  //     },
  //     (userCredential) {
  //       if (userCredential.user != null) {
  //         emit(FacebookAuthSuccess());
  //       }
  //     },
  //   );
  // }
}
