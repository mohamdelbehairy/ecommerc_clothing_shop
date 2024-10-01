import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';

abstract class SocialAuthRepo {
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signInWithFacebook();
  Future<bool> isUserDataSaved(String userId);
  Future<Either<Failure, void>> googleLogout();
  Future<Either<Failure, void>> facebookLogout();
}
