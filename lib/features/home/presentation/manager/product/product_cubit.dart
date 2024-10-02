import 'dart:developer';

import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:e_clot_shop/features/home/data/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(ProductInitial());
  final ProductRepo _productRepo;

  List<ProductModel> hoddies = [];
  void getProduct() {
    try {
      _productRepo.getAllProducts((snapshot) {
        hoddies = [];
        for (var element in snapshot.docs) {
          var product = ProductModel.fromJson(element.data());
          if (product.category.contains('hoodies')) {
            hoddies.add(product);
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
