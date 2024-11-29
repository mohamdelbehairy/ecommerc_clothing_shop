import 'package:e_clot_shop/features/app/presentation/manager/build_app/build_app_cubit.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/svg_model.dart';
import '../../../../core/widgets/function/loading_animation_widget.dart';
import '../../data/models/auth_item_model.dart';

class ProviderAuthItem extends StatelessWidget {
  const ProviderAuthItem({super.key, required this.authItemModel});
  final AuthItemModel authItemModel;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = context.read<BuildAppCubit>();
    return InkWell(
      onTap: authItemModel.onTap,
      child: Container(
        height: 55,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: isDarkMode.isDarkMode
                ? AppColors.darkModeSecondryColor
                : AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Stack(
          children: [
            Positioned(
                top: 0.0,
                bottom: 0.0,
                child: CustomSvg(
                    svgModel: SvgModel(image: authItemModel.icon, height: 24))),
            Align(
                alignment: Alignment.center,
                child: authItemModel.isLoading
                    ? loadingAnimationWidget(
                        color: isDarkMode.isDarkMode ? Colors.white : null)
                    : Text(authItemModel.text,
                        style: Styles.styleMedium16(context)))
          ],
        ),
      ),
    );
  }
}
