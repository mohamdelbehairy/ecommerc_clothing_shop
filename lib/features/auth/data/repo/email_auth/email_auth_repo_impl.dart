import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/remove_user_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/cached_user_id_and_first_login.dart';
import 'email_auth_repo.dart';

class EmailAuthRepoImpl extends EmailAuthRepo {
  
  @override
  Future<Either<Failure, void>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await cachedUserIdAndFirstLogin(credential);
      }
      return const Right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await cachedUserIdAndFirstLogin(credential);
      }
      return const Right(null);
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
      await removeUserId();
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
