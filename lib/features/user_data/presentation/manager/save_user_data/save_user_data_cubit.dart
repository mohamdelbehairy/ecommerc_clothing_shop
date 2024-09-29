import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_data_model.dart';
import '../../../data/repo/user_data_repo.dart';

part 'save_user_data_state.dart';

class SaveUserDataCubit extends Cubit<SaveUserDataState> {
  SaveUserDataCubit(this._userDataRepo) : super(SaveUserDataInitial());

  final UserDataRepo _userDataRepo;

  Future<void> saveUserData({required UserDataModel userDataModel}) async {
    final result = await _userDataRepo.saveUserData(userDataModel);
    result.fold(
      (failure) {
        emit(SaveUserDataFailure(errorMessage: failure.message));
        log('error from save user data: ${failure.message}');
      },
      (success) => emit(SaveUserDataSuccess()),
    );
  }
}
