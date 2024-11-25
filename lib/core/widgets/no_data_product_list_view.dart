import 'package:e_clot_shop/core/manager/build_app/build_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../features/home/presentation/widgets/skeletonizer/product_list_view_skeleronizer.dart';

class NoDataProudctListView extends StatelessWidget {
  const NoDataProudctListView({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;

    return Skeletonizer(
        enabled: true,
        effect: PulseEffect(
            from: isDarkMode ? Colors.white12 : Colors.grey.shade300,
            to: isDarkMode ? Colors.white24 : Colors.grey.shade100),
        child: const ProductListViewSkeleronizer());
  }
}
