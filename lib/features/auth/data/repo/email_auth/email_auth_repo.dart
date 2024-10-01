import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';

abstract class EmailAuthRepo {
  Future<Either<Failure, void>> registerWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, void>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, void>> forgetPassword(String email);

  Future<Either<Failure, void>> emailLogout();
}
