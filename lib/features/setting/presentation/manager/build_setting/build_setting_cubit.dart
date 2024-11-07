import 'package:e_clot_shop/core/utils/app_router.dart';
import 'package:e_clot_shop/features/setting/data/models/setting_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'build_setting_state.dart';

class BuildSettingCubit extends Cubit<BuildSettingState> {
  BuildSettingCubit(this._context) : super(BuildSettingInitial()) {
    _initItems();
  }
  final BuildContext _context;

  List items = [];

  _initItems() {
    items = [
      SettingItemModel(name: 'Address', onTap: () {}),
      SettingItemModel(
          name: 'Wishlist',
          onTap: () => GoRouter.of(_context).push(AppRouter.wishlist)),
      SettingItemModel(name: 'Payment'),
      SettingItemModel(name: 'Dark Mode'),
      // SettingItemModel(name: 'Help', onTap: () {}),
      SettingItemModel(name: 'Support', onTap: () {}),
    ];
  }
}
