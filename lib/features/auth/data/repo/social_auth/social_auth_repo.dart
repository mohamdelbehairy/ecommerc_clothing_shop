import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class SocialAuthRepo {
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  // Future<Either<Failure, UserCredential>> signInWithFacebook();
  Future<Either<Failure, UserCredential>> signInWithTwitter();
  Future<Either<Failure, UserCredential>> signInWithGithub(
      BuildContext context);
  Future<bool> isUserDataSaved(String userId);
  Future<Either<Failure, void>> googleLogout();
  // Future<Either<Failure, void>> facebookLogout();
  Future<Either<Failure, void>> twitterLogout();
}
