import 'package:dartz/dartz.dart';
import 'package:e_clot_shop/core/error/failure.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../shared_pref/data/models/shared_pref_model.dart';
import '../../../../shared_pref/data/repo/shared_pref_repo.dart';
import '../../../../shared_pref/data/repo/shared_pref_repo_impl.dart';
import 'email_auth_repo.dart';

class EmailAuthRepoImpl extends EmailAuthRepo {
  final SharedPrefRepo _sharedPrefRepo = SharedPrefRepoImpl();
  @override
  Future<Either<Failure, void>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await _sharedPrefRepo
            .setBool(SharedPrefModel(key: Constants.firstLogin, value: true));
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
        await _sharedPrefRepo
            .setBool(SharedPrefModel(key: Constants.firstLogin, value: true));
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
}
