import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/cached_and_remove_user_id.dart';
import 'email_auth_repo.dart';

class EmailAuthRepoImpl extends EmailAuthRepo {
  @override
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // if (credential.user != null) {
      //   await CachedAndRemoveUserId.cachedRegisterUserID(credential);
      // }
      return Right(credential);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // if (credential.user != null) {
      //   await CachedAndRemoveUserId.cachedLoginUserID(credential);
      // }
      return Right(credential);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> emailLogout() async {
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
