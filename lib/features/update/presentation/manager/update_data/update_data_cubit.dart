import 'dart:developer';

import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/update/data/repo/update_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user_data/data/models/user_data_model.dart';

part 'update_data_state.dart';

class UpdateDataCubit extends Cubit<UpdateDataState> {
  UpdateDataCubit(this._userDataRepo) : super(UpdateDataInitial());

  final UpdateDataRepo _userDataRepo;

  Future<void> updateUserData({String? key, required dynamic value}) async {
    emit(UpdateDataLoading());
    final result = await _userDataRepo.updateUserData(
        key ?? Constants.paymentMethod, value);

    result.fold((e) {
      emit(UpdateDataFailure(errorMessage: e.toString()));
      log('error from update user data: $e');
    }, (e) => emit(UpdateUserDataSuccess()));
  }

  Future<void> updateAllUserData({required UserDataModel userData}) async {
    emit(UpdateAllUserDataLoading());
    final result = await _userDataRepo.updateAllUserData(userData);

    result.fold((e) {
      emit(UpdateDataFailure(errorMessage: e.toString()));
      log('error from update all user data: $e');
    }, (e) => emit(UpdateAllUserDataSuccess()));
  }

  Future<void> updateProductData(
      {required String productID, required dynamic value}) async {
    emit(UpdateDataLoading());
    final result = await _userDataRepo.updateProductData(
        productID, Constants.sellingCount, value);

    result.fold((e) {
      emit(UpdateDataFailure(errorMessage: e.toString()));
      log('error from update product data: $e');
    }, (e) => emit(UpdateProductDataSuccess()));
  }

  Future<void> updateNotification({required String notifyID}) async {
    emit(UpdateDataLoading());
    final result = await _userDataRepo.updateNotification(notifyID);

    result.fold((e) {
      emit(UpdateDataFailure(errorMessage: e.toString()));
      log('error from update notification: $e');
    }, (e) => emit(UpdateNotificationSuccess()));
  }
}
