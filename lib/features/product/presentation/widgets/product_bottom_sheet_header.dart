import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductBottomSheetheader extends StatelessWidget {
  const ProductBottomSheetheader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Spacer(flex: 4),
          Text(text, style: Styles.styleBoldNunito24),
          const Spacer(flex: 3),
          IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: const Icon(Icons.close, size: 28, color: Color(0xff272727)))
        ],
      ),
    );
  }
}
