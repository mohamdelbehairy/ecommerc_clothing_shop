import 'dart:developer';

import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/update/data/repo/update_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_data_state.dart';

class UpdateDataCubit extends Cubit<UpdateDataState> {
  UpdateDataCubit(this._userDataRepo) : super(UpdateDataInitial());

  final UpdateDataRepo _userDataRepo;

  Future<void> updateUserData({required dynamic value}) async {
    emit(UpdateDataLoading());
    final result =
        await _userDataRepo.updateUserData(Constants.paymentMethod, value);

    result.fold((e) {
      emit(UpdateDataFailure(errorMessage: e.toString()));
      log('error from update user data: $e');
    }, (e) => emit(UpdateUserDataSuccess()));
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
}
