import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/presentation/manager/change_theme/change_theme_cubit.dart';
import '../../data/models/search_filter_model.dart';
import 'filter_item.dart';
import 'search_filter_widget.dart';

class SearchFilterlistView extends StatelessWidget {
  const SearchFilterlistView({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<ChangeThemeCubit>().isDarkMode;
    return Row(
      children: [
        const FilterItem(),
        const SizedBox(width: 6),
        SearchFilterWidget(searchFilterModel: SearchFilterModel(text: 'Price')),
        const SizedBox(width: 6),
        SearchFilterWidget(
            searchFilterModel: SearchFilterModel(
                isBool: false,
                background: isDarkMode
                    ? AppColors.darkModeSecondryColor
                    : AppColors.secondaryColor,
                text: 'Sort  by')),
        const SizedBox(width: 6),
        SearchFilterWidget(searchFilterModel: SearchFilterModel(text: 'Men')),
      ],
    );
  }
}
