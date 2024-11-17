import 'package:e_clot_shop/core/widgets/custom_back_widget.dart';
import 'package:flutter/material.dart';

import 'profile_view_bloc_builder.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63),
          CustomBackWidget(),
          Flexible(child: ProfileViewBlocBuilder())
        ],
      ),
    );
  }
}
