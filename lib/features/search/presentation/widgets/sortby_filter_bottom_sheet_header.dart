import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/manager/build_app/build_app_cubit.dart';
import '../../../../core/widgets/custom_bottom_sheet_header.dart';

class SortbyFilterBottomSheetHeader extends StatelessWidget {
  const SortbyFilterBottomSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var buildApp = context.read<BuildAppCubit>();
    return CustomBottomSheetheader(
        text: 'Sort by',
        clear: 'Clear',
        onTap: () {
          if (buildApp.sortbyIndex > 0) {
            GoRouter.of(context).pop();
            buildApp.clearSortbyBottomSheet();
          }
        });
  }
}
