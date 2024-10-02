import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/see_all_widget.dart';
import 'package:flutter/material.dart';
import '../../../user_data/data/models/user_data_model.dart';
import 'home_categories_section.dart';
import 'home_header_section.dart';
import 'home_search_widget.dart';

class HomeWhenStateSuccess extends StatelessWidget {
  const HomeWhenStateSuccess({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 63),
          HomeHeaderSection(userData: userData),
          const SizedBox(height: 24),
          const HomeSearchWidget(),
          const SizedBox(height: 28),
          const HomeCategoiresSection(),
          const SizedBox(height: 24),
          // const HomeTopSellingHeader(),
        ],
      ),
    );
  }
}

// class HomeTopSellingHeader extends StatelessWidget {
//   const HomeTopSellingHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text('Top Selling', style: Styles.styleBold16),
//         SeeAllWidget(onTap: () {}),
//       ],
//     );
//   }
// }
