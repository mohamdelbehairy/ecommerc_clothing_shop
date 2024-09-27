import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class EmailAuthRepo {
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      String email, String password);
}
