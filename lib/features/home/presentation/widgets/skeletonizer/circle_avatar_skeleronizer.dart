import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CircleAvatarSkeleronizer extends StatelessWidget {
  const CircleAvatarSkeleronizer({super.key, this.radius = 22});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        backgroundImage: const AssetImage(Assets.imagesHoodies));
  }
}
