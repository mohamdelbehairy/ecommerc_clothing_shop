import 'package:flutter/material.dart';
import 'home_new_in_header.dart';
import 'home_new_in_list_view.dart';

class HomeNewInSection extends StatelessWidget {
  const HomeNewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: HomeNewInHeader()),
        SizedBox(height: 16),
        Padding(padding: EdgeInsets.only(left: 24), child: HomeNewInListView())
      ],
    );
  }
}

