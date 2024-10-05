import 'package:e_clot_shop/core/widgets/build_view_body.dart';
import 'package:flutter/material.dart';
import '../widgets/new_in_view_body.dart';

class NewInView extends StatelessWidget {
  const NewInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildViewBody(child: NewInViewBody()),
    );
  }
}
