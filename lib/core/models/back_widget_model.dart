import 'package:flutter/material.dart';

class BackWidgetModel {
  final double angle;
  final double hight;
  final Function()? onTap;
  final ColorFilter? colorFilter;

  BackWidgetModel(
      {this.angle = 180 * 3.1415927 / 180,
      this.hight = 16,
      this.onTap,
      this.colorFilter});
}
