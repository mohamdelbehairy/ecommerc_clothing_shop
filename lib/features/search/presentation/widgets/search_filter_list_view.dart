import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/widgets/function/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../../data/models/search_filter_model.dart';
import 'filter_item.dart';
import 'search_filter_widget.dart';
import 'search_price_bottom_sheet.dart';

class SearchFilterListView extends StatelessWidget {
  const SearchFilterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FilterItem(),
        const SizedBox(width: 6),
        SearchFilterWidget(
            searchFilterModel: SearchFilterModel(
                text: 'Price',
                onTap: () => customBottomSheet(context,
                    child: const SearchPriceBottomSheet()))),
        const SizedBox(width: 6),
        SearchFilterWidget(
            searchFilterModel: SearchFilterModel(
          isBool: false,
          background: context.read<ChangeThemeCubit>().isDarkMode
              ? AppColors.darkModeSecondryColor
              : AppColors.secondaryColor,
          text: 'Sort  by',
          onTap: () {},
        )),
        const SizedBox(width: 6),
        SearchFilterWidget(
            searchFilterModel: SearchFilterModel(
          text: 'Men',
          onTap: () {},
        )),
      ],
    );
  }
}
