import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/function/custom_bottom_sheet.dart';
import '../../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../../../data/models/search_filter_model.dart';
import '../../widgets/search_price_bottom_sheet.dart';

part 'build_search_state.dart';

class BuildSearchCubit extends Cubit<BuildSearchState> {
  BuildSearchCubit(this._context) : super(BuildSearchInitial()) {
    _checkSearch();
    _initSearchHeader();
  }
  final BuildContext _context;

  TextEditingController searchController = TextEditingController();
  List<ProductModel> list = [];
  List<ProductModel> searchList = [];

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
          isBool: false,
          background: _context.read<ChangeThemeCubit>().isDarkMode
              ? AppColors.darkModeSecondryColor
              : AppColors.secondaryColor,
          text: 'Category',
          onTap: () {}),
      SearchFilterModel(
          text: 'Price',
          onTap: () => customBottomSheet(_context,
              child: const SearchPriceBottomSheet())),
      SearchFilterModel(
        isBool: false,
        background: _context.read<ChangeThemeCubit>().isDarkMode
            ? AppColors.darkModeSecondryColor
            : AppColors.secondaryColor,
        text: 'Sort  by',
        onTap: () {},
      ),
      SearchFilterModel(text: 'Men', onTap: () {})
    ];
  }
}
