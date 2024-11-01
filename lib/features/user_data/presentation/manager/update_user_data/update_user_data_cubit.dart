import 'dart:developer';

import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/user_data_repo.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit(this._userDataRepo) : super(UpdateUserDataInitial());

  final UserDataRepo _userDataRepo;

  Future<void> updateUserData({required dynamic value}) async {
    emit(UpdateUserDataLoading());
    final result =
        await _userDataRepo.updateUserData(Constants.paymentMethod, value);

    result.fold((e) {
      emit(UpdateUserDataFailure(errorMessage: e.toString()));
      log('error from update user data: $e');
    }, (e) => emit(UpdateUserDataSuccess()));
  }
}
