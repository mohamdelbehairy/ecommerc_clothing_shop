import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'social_auth_repo.dart';

class SocialAuthRepoImpl extends SocialAuthRepo {
  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      UserCredential? userCredential;
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return Right(userCredential!);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithFacebook() async {
    try {
      UserCredential? userCredential;
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
                loginResult.accessToken!.tokenString);

        userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      }

      return Right(userCredential!);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
