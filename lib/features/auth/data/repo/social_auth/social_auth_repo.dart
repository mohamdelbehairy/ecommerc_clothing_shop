import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SocialAuthRepo {
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  Future<Either<Failure, UserCredential>> signInWithFacebook();
  Future<bool> isUserDataSaved(String userId);
  Future<Either<Failure, void>> googleLogout();
  Future<Either<Failure, void>> facebookLogout();
}
