import 'package:flutter/material.dart';

import '../../../user_data/data/models/user_data_model.dart';
import 'home_categories_section.dart';
import 'home_header_section.dart';
import 'home_new_in_section.dart';
import 'home_search_widget.dart';
import 'home_top_selling_section.dart';

class HomeWhenStateSuccessBody extends StatelessWidget {
  const HomeWhenStateSuccessBody({super.key, required this.userData});

  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 63),
          HomeHeaderSection(userData: userData),
          const SizedBox(height: 24),
          const HomeSearchWidget(),
          const SizedBox(height: 28),
          const HomeCategoiresSection(),
          const SizedBox(height: 24),
          const HomeTopSellingSection(),
          const SizedBox(height: 24),
          const HomeNewInSection(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
