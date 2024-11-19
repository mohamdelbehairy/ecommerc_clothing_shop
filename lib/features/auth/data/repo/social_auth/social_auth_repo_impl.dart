import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/cached_and_remove_user_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../../../core/utils/secret_key.dart';
import 'social_auth_repo.dart';

class SocialAuthRepoImpl extends SocialAuthRepo {
  // final UserDataRepo _userDataRepo = UserDataRepoImpl();
  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      UserCredential? userCredential;
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return Right(userCredential!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, UserCredential>> signInWithFacebook() async {
  //   try {
  //     UserCredential? userCredential;
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     if (loginResult.accessToken != null) {
  //       final OAuthCredential facebookAuthCredential =
  //           FacebookAuthProvider.credential(
  //               loginResult.accessToken!.tokenString);

  //       userCredential = await FirebaseAuth.instance
  //           .signInWithCredential(facebookAuthCredential);

  //       if (userCredential.user != null) {
  //         if (!await isUserDataSaved(userCredential.user!.uid)) {
  //           await _userDataRepo.saveUserData(UserDataModel(
  //               userName: userCredential.user!.displayName!,
  //               email: userCredential.user!.email!,
  //               userId: userCredential.user!.uid,
  //               authType: Constants.facebook));
  //         }
  //         await cachedUserIdAndFirstLogin(userCredential);
  //       }
  //     }

  //     return Right(userCredential!);
  //   } catch (e) {
  //     if (e is FirebaseAuthException) {
  //       return Left(FirebaseFailure.fromCode(e.code));
  //     }

  //     return Left(Failure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, UserCredential>> signInWithTwitter() async {
    try {
      UserCredential? userCredential;
      final twitterLogin = TwitterLogin(
          apiKey: SecretKey.twitterApiKey,
          apiSecretKey: SecretKey.twitterApiSecretKey,
          redirectURI: SecretKey.twitterRedirectURI);

      final authResult = await twitterLogin.login();
      if (authResult.status == TwitterLoginStatus.loggedIn) {
        final twitterAuthCredential = TwitterAuthProvider.credential(
          accessToken: authResult.authToken!,
          secret: authResult.authTokenSecret!,
        );
        userCredential = await FirebaseAuth.instance
            .signInWithCredential(twitterAuthCredential);
      }
      return Right(userCredential!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGithub(
      BuildContext context) async {
    try {
      UserCredential? userCredential;
      final GitHubSignIn gitHubSignIn = GitHubSignIn(
          clientId: SecretKey.githubClientId,
          clientSecret: SecretKey.githubClientSecret,
          redirectUrl: SecretKey.githubRedirectURI);

      final authResult = await gitHubSignIn.signIn(context);

      if (authResult.status == GitHubSignInResultStatus.ok) {
        final githubAuthCredential =
            GithubAuthProvider.credential(authResult.token!);

        userCredential = await FirebaseAuth.instance
            .signInWithCredential(githubAuthCredential);
      }

      return Right(userCredential!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> googleLogout() async {
    try {
      await CachedAndRemoveUserId.removeUserID();
      await GoogleSignIn().signOut();

      return const Right(true);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, void>> facebookLogout() async {
  //   try {
  //     await removeUserId();
  //     await FacebookAuth.instance.logOut();
  //     return const Right(null);
  //   } catch (e) {
  //     if (e is FirebaseAuthException) {
  //       return Left(FirebaseFailure.fromCode(e.code));
  //     }

  //     return Left(Failure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, void>> twitterLogout() async {
    try {
      await CachedAndRemoveUserId.removeUserID();
      await FirebaseAuth.instance.signOut();
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }
      return Left(Failure(message: e.toString()));
    }
  }
}
