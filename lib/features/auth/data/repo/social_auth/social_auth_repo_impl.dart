import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:e_clot_shop/features/user_data/data/repo/user_data_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../user_data/data/repo/user_data_repo_impl.dart';
import 'social_auth_repo.dart';

class SocialAuthRepoImpl extends SocialAuthRepo {
  final UserDataRepo _userDataRepo = UserDataRepoImpl();
  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        var userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null) {
          if (!await isUserDataSaved(userCredential.user!.uid)) {
            await _userDataRepo.saveUserData(UserDataModel(
                userName: userCredential.user!.displayName!,
                email: userCredential.user!.email!,
                userId: userCredential.user!.uid));
          }
        }
      }
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
                loginResult.accessToken!.tokenString);

        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        if (userCredential.user != null) {
          if (!await isUserDataSaved(userCredential.user!.uid)) {
            await _userDataRepo.saveUserData(UserDataModel(
                userName: userCredential.user!.displayName!,
                email: userCredential.user!.email!,
                userId: userCredential.user!.uid));
          }
        }
      }

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<bool> isUserDataSaved(String userId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(Constants.usersCollection)
        .doc(userId)
        .get();
    return snapshot.exists;
  }
}
