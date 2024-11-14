import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../features/home/presentation/widgets/skeletonizer/product_list_view_skeleronizer.dart';
import '../../features/theme/presentation/manager/change_theme/change_theme_cubit.dart';

class NoDataProudctListView extends StatelessWidget {
  const NoDataProudctListView({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<ChangeThemeCubit>().isDarkMode;

    return Skeletonizer(
        enabled: true,
        effect: PulseEffect(
            from: isDarkMode ? Colors.white12 : Colors.grey.shade300,
            to: isDarkMode ? Colors.white24 : Colors.grey.shade100),
        child: const ProductListViewSkeleronizer());
  }
}
