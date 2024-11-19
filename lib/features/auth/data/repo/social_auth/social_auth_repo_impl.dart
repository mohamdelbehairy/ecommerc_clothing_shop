import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/api_service.dart';
import 'package:e_clot_shop/core/utils/cached_and_reomve_user_id.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/core/utils/setup_service_locator.dart';
import 'package:e_clot_shop/features/payment/data/repo/strip_repo_impl.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:e_clot_shop/features/user_data/data/repo/user_data_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../../../core/utils/secret_key.dart';
import '../../../../user_data/data/repo/user_data_repo_impl.dart';
import 'social_auth_repo.dart';

class SocialAuthRepoImpl extends SocialAuthRepo {
  final UserDataRepo _userDataRepo = UserDataRepoImpl();
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

        if (userCredential.user != null) {
          await saveUserDataFunc(userCredential, Constants.google);

          await CachedAndRemoveUserId.cachedLoginUserID(userCredential);
        }
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
        if (userCredential.user != null) {
          await saveUserDataFunc(userCredential, Constants.twitter);

          await CachedAndRemoveUserId.cachedLoginUserID(userCredential);
        }
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
        if (userCredential.user != null) {
          await saveUserDataFunc(userCredential, Constants.github);

          await CachedAndRemoveUserId.cachedLoginUserID(userCredential);
        }
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
  Future<bool> isUserDataSaved(String userId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(Constants.usersCollection)
        .doc(userId)
        .get();
    return snapshot.exists;
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

  Future<void> saveUserDataFunc(
      UserCredential userCredential, String authType) async {
    if (!await isUserDataSaved(userCredential.user!.uid)) {
      await _userDataRepo.saveUserData(UserDataModel(
          userName: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          userId: userCredential.user!.uid,
          authType: authType,
          dateTime: DateTime.now()));
      await StripRepoImpl(getIt.get<ApiService>()).createCustomer(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName!);
    }
  }
}
