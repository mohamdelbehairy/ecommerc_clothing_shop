  import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingAnimationWidget() {
    return LoadingAnimationWidget.staggeredDotsWave(
        color: const Color(0xff272727), size: 28);
  }