import 'package:e_clot_shop/core/models/back_widget_model.dart';
import 'package:e_clot_shop/core/models/background_model.dart';
import 'package:e_clot_shop/core/utils/colors.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/back_widget.dart';
import 'package:e_clot_shop/core/widgets/custom_background_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../../data/models/search_filter_model.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({super.key, required this.searchFilterModel});
  final SearchFilterModel searchFilterModel;

  @override
  Widget build(BuildContext context) {
    var buildApp = context.watch<BuildAppCubit>();

    return CustomBakgroundContainer(
      backgroundModel: BackgroundModel(
          height: 29,
          borderRadiusDouble: 100,
          padding: 14,
          color: searchFilterModel.background,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  searchFilterModel.text != null
                      ? searchFilterModel.text!
                      : buildApp.gender[buildApp.genderIndex],
                  style: !searchFilterModel.isBool
                      ? Styles.styleMedium12(context)
                      : Styles.styleMedium12(context)
                          .copyWith(color: AppColors.whiteColor)),
              const SizedBox(width: 10),
              BackWidget(
                  backWidgetModel: BackWidgetModel(
                      angle: -90 * 3.14 / 180,
                      hight: 14,
                      onTap: searchFilterModel.onTap,
                      colorFilter: searchFilterModel.isBool
                          ? const ColorFilter.mode(
                              AppColors.whiteColor, BlendMode.srcIn)
                          : null))
            ],
          )),
    );
  }
}
