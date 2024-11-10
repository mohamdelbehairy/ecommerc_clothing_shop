import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/function/custom_bottom_sheet.dart';
import '../../../../home/data/repo/product_repo.dart';
import '../../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../../../data/models/search_filter_model.dart';
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
  List<ProductModel> maxPrice = [];
  List<ProductModel> minPrice = [];
  List<ProductModel> newest = [];
  List<ProductModel> oldest = [];

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
      // SearchFilterModel(
      //     isBool: false,
      //     background: _context.read<ChangeThemeCubit>().isDarkMode
      //         ? AppColors.darkModeSecondryColor
      //         : AppColors.secondaryColor,
      //     text: 'Category',
      //     onTap: () => customBottomSheet(_context,
      //         child: const CategoryFilterBottomSheet())),
      SearchFilterModel(
          text: 'Price',
          onTap: () => customBottomSheet(_context,
              child: const PriceFilterBottomSheet())),
      SearchFilterModel(
          isBool: false,
          background: _context.read<ChangeThemeCubit>().isDarkMode
              ? AppColors.darkModeSecondryColor
              : AppColors.secondaryColor,
          text: 'Sort  by',
          onTap: () => customBottomSheet(_context,
              child: const SortbyFilterBottomSheet())),
      SearchFilterModel(text: 'Men', onTap: () {})
    ];
  }

  void _getAllProducts() {
    _productRepo.getAllProducts((snapshot) {
      allProducts = [];
      maxPrice = [];
      minPrice = [];
      newest = [];
      oldest = [];
      for (var element in snapshot.docs) {
        var product = ProductModel.fromJson(element.data());
        allProducts.add(product);

        if (int.parse(product.price) >= 50) {
          maxPrice.add(product);
        }
        if (int.parse(product.price) < 50) {
          minPrice.add(product);
        }
        if (product.createdTime
            .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
          newest.add(product);
        }

        if (product.createdTime
            .isBefore(DateTime.now().subtract(const Duration(days: 7)))) {
          oldest.add(product);
        }
      }

      emit(GetAllproductsSuccess());
    });
  }
}
