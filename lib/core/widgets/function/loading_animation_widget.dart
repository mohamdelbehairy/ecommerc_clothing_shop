import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingAnimationWidget({Color? color, double? size}) {
  return LoadingAnimationWidget.staggeredDotsWave(
      color: color ?? const Color(0xff272727), size: size ?? 28);
}
