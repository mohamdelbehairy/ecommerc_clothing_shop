import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/bottom_sheet_list_view_item.dart';

class SettingDarkModeListView extends StatelessWidget {
  const SettingDarkModeListView({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
            2,
            (index) => GestureDetector(
                  onTap: () {
                    buildApp.changeThemeIndex(index);
                  },
                  child: BottomSheetListViewItem(
                      isActive: buildApp.themeIndex == index,
                      productSelectDetails: buildApp.themeList[index]),
                )),
      ),
    );
  }
}
