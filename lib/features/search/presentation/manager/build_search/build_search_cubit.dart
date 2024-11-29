import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/constants.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/function/custom_bottom_sheet.dart';
import '../../../../home/data/repo/product_repo.dart';
import '../../../data/models/search_filter_model.dart';
import '../../widgets/gender_filter_bottom_sheet.dart';
import '../../widgets/price_filter_bottom_sheet.dart';
import '../../widgets/sortby_filter_bottom_sheet.dart';

part 'build_search_state.dart';

class BuildSearchCubit extends Cubit<BuildSearchState> {
  BuildSearchCubit(this._context, this._productRepo)
      : super(BuildSearchInitial()) {
    _checkSearch();
    _initSearchHeader();
    _getAllProducts();
  }
  final BuildContext _context;
  final ProductRepo _productRepo;

  TextEditingController searchController = TextEditingController();
  List<ProductModel> list = [];
  List<ProductModel> searchList = [];

  List<ProductModel> allProducts = [];

  List<ProductModel> men = [];
  List<ProductModel> women = [];
  List<ProductModel> minNewestMen = [];
  List<ProductModel> minOldestMen = [];
  List<ProductModel> maxNewestMen = [];
  List<ProductModel> maxOldestMen = [];
  List<ProductModel> minNewestWomen = [];
  List<ProductModel> minOldestWomen = [];
  List<ProductModel> maxNewestWomen = [];
  List<ProductModel> maxOldestWomen = [];

  List<ProductModel> minPriceMen = [];
  List<ProductModel> maxPriceMen = [];
  List<ProductModel> minPriceWomen = [];
  List<ProductModel> maxPriceWomen = [];

  List<ProductModel> newestMen = [];
  List<ProductModel> oldestMen = [];
  List<ProductModel> newestWomen = [];
  List<ProductModel> oldestWomen = [];

  bool isSearch = false;
  void _checkSearch() {
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        isSearch = true;
      } else {
        isSearch = false;
      }
      emit(CheckSearchSuccess());
    });
  }

  void clearSearch() {
    searchController.clear();
    emit(ClearSearchSuccess());
  }

  List<SearchFilterModel> searchHeader = [];

  _initSearchHeader() {
    searchHeader = [
      SearchFilterModel(
          text: 'Price',
          onTap: () => customBottomSheet(_context,
              child: const PriceFilterBottomSheet())),
      SearchFilterModel(
          isBool: false,
          background: _context.read<BuildAppCubit>().isDarkMode
              ? AppColors.darkModeSecondryColor
              : AppColors.secondaryColor,
          text: 'Sort  by',
          onTap: () => customBottomSheet(_context,
              child: const SortbyFilterBottomSheet())),
      SearchFilterModel(
          onTap: () => customBottomSheet(_context,
              child: const GenderFilterBottomSheet()))
    ];
  }

  void _getAllProducts() {
    _productRepo.getAllProducts((snapshot) {
      allProducts = [];
      men = [];
      women = [];
      minNewestMen = [];
      minOldestMen = [];
      maxNewestMen = [];
      maxOldestMen = [];
      minNewestWomen = [];
      minOldestWomen = [];
      maxNewestWomen = [];
      maxOldestWomen = [];
      minPriceMen = [];
      maxPriceMen = [];
      minPriceWomen = [];
      maxPriceWomen = [];
      newestMen = [];
      oldestMen = [];
      newestWomen = [];
      oldestWomen = [];

      for (var element in snapshot.docs) {
        var product = ProductModel.fromJson(element.data());
        allProducts.add(product);

        if (num.parse(product.price) < 40 &&
            product.createdTime
                .isBefore(DateTime.now().subtract(const Duration(days: 7)))) {
          if (product.gender == Constants.men) {
            minOldestMen.add(product);
          }

          if (product.gender == Constants.women) {
            minOldestWomen.add(product);
          }
        }

        if (num.parse(product.price) >= 40 &&
            product.createdTime
                .isBefore(DateTime.now().subtract(const Duration(days: 7)))) {
          if (product.gender == Constants.men) {
            maxOldestMen.add(product);
          }
          if (product.gender == Constants.women) {
            maxOldestWomen.add(product);
          }
        }

        if (num.parse(product.price) < 40 &&
            product.createdTime
                .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
          if (product.gender == Constants.men) {
            minNewestMen.add(product);
          }
          if (product.gender == Constants.women) {
            minNewestWomen.add(product);
          }
        }

        if (num.parse(product.price) >= 40 &&
            product.createdTime
                .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
          if (product.gender == Constants.men) {
            maxNewestMen.add(product);
          }

          if (product.gender == Constants.women) {
            maxNewestWomen.add(product);
          }
        }

        if (product.gender == Constants.men) {
          men.add(product);
        }
        if (product.gender == Constants.women) {
          women.add(product);
        }

        if (num.parse(product.price) >= 40 && product.gender == Constants.men) {
          maxPriceMen.add(product);
        }

        if (num.parse(product.price) < 40 && product.gender == Constants.men) {
          minPriceMen.add(product);
        }

        if (num.parse(product.price) >= 40 &&
            product.gender == Constants.women) {
          maxPriceWomen.add(product);
        }

        if (num.parse(product.price) < 40 &&
            product.gender == Constants.women) {
          minPriceWomen.add(product);
        }

        if (product.createdTime
                .isAfter(DateTime.now().subtract(const Duration(days: 7))) &&
            product.gender == Constants.men) {
          newestMen.add(product);
        }
        if (product.createdTime
                .isBefore(DateTime.now().subtract(const Duration(days: 7))) &&
            product.gender == Constants.men) {
          oldestMen.add(product);
        }

        if (product.createdTime
                .isAfter(DateTime.now().subtract(const Duration(days: 7))) &&
            product.gender == Constants.women) {
          newestWomen.add(product);
        }
        if (product.createdTime
                .isBefore(DateTime.now().subtract(const Duration(days: 7))) &&
            product.gender == Constants.women) {
          oldestWomen.add(product);
        }
      }

      emit(GetAllproductsSuccess());
    });
  }
}
