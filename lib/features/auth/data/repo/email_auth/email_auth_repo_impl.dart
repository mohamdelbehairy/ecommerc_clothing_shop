import 'package:dartz/dartz.dart';

import 'package:e_clot_shop/core/error/failure.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'email_auth_repo.dart';

class EmailAuthRepoImpl extends EmailAuthRepo {
  @override
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
      return Right(credential);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(FirebaseFailure.fromCode(e.code));
      }

      return Left(Failure(message: e.toString()));
    }
  }
}
