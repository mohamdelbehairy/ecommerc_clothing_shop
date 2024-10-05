import 'package:e_clot_shop/core/widgets/build_view_body.dart';
import 'package:flutter/material.dart';

import '../widgets/top_selling_view_body.dart';

class TopSellingView extends StatelessWidget {
  const TopSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildViewBody(child: TopSellingViewBody()),
    );
  }
}

