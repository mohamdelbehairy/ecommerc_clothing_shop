import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../home_categories_section.dart';
import 'home_header_skeleronizer.dart';
import 'home_search_skeleronzier.dart';
import 'home_top_selling_and_new_in_skeleronizer.dart';

class HomeWhenStateLoading extends StatelessWidget {
  const HomeWhenStateLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>().isDarkMode;

    return Skeletonizer(
      enabled: true,
      effect: PulseEffect(
          from: isDarkMode ? Colors.white12 : Colors.grey.shade300,
          to: isDarkMode ? Colors.white24 : Colors.grey.shade100),
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 63),
            HomeHeaderSkeleronizer(),
            SizedBox(height: 24),
            HomeSearchSkeleronizer(),
            SizedBox(height: 28),
            HomeCategoiresSection(),
            SizedBox(height: 24),
            HomeTopSellingSkeleronizer(),
            SizedBox(height: 24),
            HomeNewInSkeleronizer(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
