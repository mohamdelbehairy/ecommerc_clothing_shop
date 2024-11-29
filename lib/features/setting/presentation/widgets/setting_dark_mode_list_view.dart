import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/bottom_sheet_list_view_item.dart';
import '../../../product/data/models/product_select_details_model.dart';

class SettingDarkModeListView extends StatelessWidget {
  const SettingDarkModeListView({super.key});

  @override
  Widget build(BuildContext context) {
    var changeTheme = context.watch<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
          children: List.generate(2, (index) {
        bool isActive = (index == 0 && !changeTheme.isDarkMode) ||
            (index == 1 && changeTheme.isDarkMode);
        return GestureDetector(
          onTap: () async {
            changeTheme.changeThemeIndex(index);
            index == 0
                ? changeTheme.changeDarkMode(false)
                : changeTheme.changeDarkMode(true);
          },
          child: BottomSheetListViewItem(
              isActive: isActive,
              productSelectDetails: ProductSelectDetailsModel(
                title: changeTheme.themeList[index],
              )),
        );
      })),
    );
  }
}
