import 'dart:developer';

import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:e_clot_shop/features/home/data/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(ProductInitial());
  final ProductRepo _productRepo;

  List<ProductModel> products = [];
  void getProduct() {
    try {
      _productRepo.getAllProducts((snapshot) {
        products = [];
        for (var element in snapshot.docs) {
          products.add(ProductModel.fromJson(element.data()));
        }
        log('products length: ${products.length}');
        emit(ProductSuccess());
      });
    } catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
      log('error from get product: $e');
    }
  }
}
