import 'dart:developer';

import 'package:e_clot_shop/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit(this._authRepo) : super(GoogleAuthInitial());
  final AuthRepo _authRepo;

  Future<void> signInWIthGoogle() async {
    emit(GoogleAuthLoading());
    try {
      final userCredential = await _authRepo.signInWIthGoogle();
      log('user credential: ${userCredential?.user}');
      emit(GoogleAuthSuccess());
    } catch (e) {
      emit(GoogleAuthFailure(errorMessage: e.toString()));
      log('error from google auth: $e');
    }
  }
}
