import 'dart:developer';

import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/features/setting/data/models/setting_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/function/custom_bottom_sheet.dart';
import '../../../data/repo/launch_url_repo.dart';
import '../../widgets/setting_dark_mode_bottom_sheet.dart';
import '../../widgets/setting_select_payment_bottom_sheet.dart';

part 'build_setting_state.dart';

class BuildSettingCubit extends Cubit<BuildSettingState> {
  BuildSettingCubit(this._context, this._launchUrlRepo)
      : super(BuildSettingInitial()) {
    _initItems();
  }
  final BuildContext _context;
  final LaunchUrlRepo _launchUrlRepo;

  List items = [];

  _initItems() {
    items = [
      SettingItemModel(name: 'Address', onTap: () {}),
      SettingItemModel(
          name: 'Wishlist',
          onTap: () => GoRouter.of(_context).push(AppRouter.wishlist)),
      SettingItemModel(
          name: 'Payment',
          onTap: () => customBottomSheet(_context,
              child: const SettingSelectPaymentBottomSheet())),
      SettingItemModel(
          name: 'Dark Mode',
          onTap: () => customBottomSheet(_context,
              child: const SettingDarkModeBottomSheet())),
      // SettingItemModel(name: 'Help', onTap: () {}),
      SettingItemModel(name: 'Support', onTap: _launchUrl),
    ];
  }

  Future<void> _launchUrl() async {
    try {
      // bool platform = Platform.isAndroid;

      // platform
      //     ? await _launchUrlRepo.launchEmail()
      //     : await _launchUrlRepo.launchSms();

      await _launchUrlRepo.launchWhatsApp();
      emit(LaunchEmailSuccess());
    } catch (e) {
      emit(LaunchUrlFailure(errorMessage: e.toString()));
      log('error from launch email: $e');
    }
  }
}
