import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_data_model.dart';
import '../../../data/repo/user_data_repo.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this._userDataRepo) : super(GetUserDataInitial());
  final UserDataRepo _userDataRepo;

  void getUserData() {
    emit(GetUserDataLoading());
    try {
      _userDataRepo.getUserData((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          List<UserDataModel> users = snapshot.docs
              .map((doc) => UserDataModel.fromJson(doc.data()))
              .toList();
          var user = users.firstWhere((element) =>
              element.userId == FirebaseAuth.instance.currentUser!.uid);
          emit(GetUserDataSuccess(user: user));
        }
      });
    } catch (e) {
      log('error from get user data: $e');
      emit(GetUserDataFailure(errorMessage: e.toString()));
    }
  }
}
