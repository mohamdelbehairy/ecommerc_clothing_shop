import 'package:flutter/material.dart';

import '../../../user_data/data/models/user_data_model.dart';
import 'home_select_type_widget.dart';
import 'home_user_image.dart';
import 'home_wishlist_widgetd.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeUserImage(userData: userData),
          HomeSelectTypeWidget(userData: userData),
          const HomeWishlistWidget(),
        ],
      ),
    );
  }
}
