import 'dart:developer';

import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:e_clot_shop/features/home/data/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(ProductInitial());
  final ProductRepo _productRepo;

  List<ProductModel> hoddies = [];
  List<ProductModel> bags = [];
  void getProduct() {
    emit(ProductLoading());
    try {
      _productRepo.getAllProducts((snapshot) {
        hoddies = [];
        bags = [];
        for (var element in snapshot.docs) {
          var product = ProductModel.fromJson(element.data());
          if (product.category.contains(Constants.hoodies)) {
            hoddies.add(product);
          }
          if (product.category.contains(Constants.bags)) {
            bags.add(product);
          }
        }
        log('products length: ${hoddies.length}');
        emit(ProductSuccess());
      });
    } catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
      log('error from get product: $e');
    }
  }
}
