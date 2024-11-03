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
  List<ProductModel> shoes = [];
  List<ProductModel> shorts = [];
  List<ProductModel> accessories = [];
  List<ProductModel> topSelling = [];
  List<ProductModel> newIn = [];
  void getProduct() {
    emit(ProductLoading());
    try {
      _productRepo.getAllProducts((snapshot) {
        hoddies = [];
        shorts = [];
        bags = [];
        shoes = [];
        accessories = [];
        topSelling = [];
        newIn = [];
        for (var element in snapshot.docs) {
          var product = ProductModel.fromJson(element.data());
          if (product.category.contains(Constants.hoodies)) {
            hoddies.add(product);
          }

          if (product.category.contains(Constants.shorts)) {
            shorts.add(product);
          }

          if (product.category.contains(Constants.shoes)) {
            shoes.add(product);
          }

          if (product.category.contains(Constants.bags)) {
            bags.add(product);
          }

          if (product.category.contains(Constants.accessories)) {
            accessories.add(product);
          }

          if (product.createdTime
              .isAfter(DateTime.now().subtract(const Duration(days: 60)))) {
            newIn.add(product);
          }
        }
        newIn.sort((a, b) => b.createdTime.compareTo(a.createdTime));
        
        topSelling = snapshot.docs
            .map((element) => ProductModel.fromJson(element.data()))
            .toList()
          ..sort((a, b) => b.sellingCount!.compareTo(a.sellingCount!));

        if (topSelling.length > 10) {
          topSelling = topSelling.sublist(0, 10);
        }

        emit(ProductSuccess());
      });
    } catch (e) {
      emit(ProductFailure(errorMessage: e.toString()));
      log('error from get product: $e');
    }
  }
}
