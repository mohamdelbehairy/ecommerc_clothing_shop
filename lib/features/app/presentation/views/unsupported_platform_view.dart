import 'dart:io';

import 'package:e_clot_shop/core/models/svg_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_svg.dart';

class UnsupportedPlatformView extends StatefulWidget {
  const UnsupportedPlatformView({super.key});

  @override
  State<UnsupportedPlatformView> createState() =>
      _UnsupportedPlatformViewState();
}

class _UnsupportedPlatformViewState extends State<UnsupportedPlatformView> {
  @override
  void initState() {
    _navigate();
    super.initState();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 5));
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 480,
          width: MediaQuery.sizeOf(context).width - 20,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(60)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              CustomSvg(svgModel: SvgModel(image: Assets.imagesSigninSuccess)),
              const SizedBox(height: 24),
              Text('This app currently supports\n mobile devices only',
                  textAlign: TextAlign.center,
                  style: Styles.styleBoldUrbainst24(context)),
              const SizedBox(height: 16),
              Text(
                  'We are working on adding support for other platforms\n in the future.We appreciate your patience.',
                  textAlign: TextAlign.center,
                  style: Styles.styleMediumUrbainst16(context)),
              const SizedBox(height: 32),
              const SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.secondaryColor,
                    strokeWidth: 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
