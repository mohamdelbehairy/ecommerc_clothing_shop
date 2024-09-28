import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TellAboutHeader extends StatelessWidget {
  const TellAboutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text('Tell us About yourself', style: Styles.styleBold24));
  }
}

