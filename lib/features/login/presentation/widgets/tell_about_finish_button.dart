import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/custom_button_model.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../manager/tell_us/tell_us_cubit.dart';

class TellAboutFinshButton extends StatelessWidget {
  const TellAboutFinshButton({super.key});

  @override
  Widget build(BuildContext context) {
    var tellAbout = context.read<TellUsCubit>();
    return Container(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.secondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
          child: CustomButton(
              customButtonModel: CustomButtonModel(
                  onTap: () {
                    log('type: ${tellAbout.type}, year: ${tellAbout.year}');
                  },
                  buttonName: 'Finish'))),
    );
  }
}
