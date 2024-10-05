import 'package:e_clot_shop/core/widgets/custom_back_widget.dart';
import 'package:flutter/material.dart';

class BuildViewBody extends StatelessWidget {
  const BuildViewBody({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 63),
          const CustomBackWidget(),
          const SizedBox(height: 16),
          Flexible(child: child)
        ],
      ),
    );
  }
}
