import 'package:e_clot_shop/features/setting/data/models/setting_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_setting_state.dart';

class BuildSettingCubit extends Cubit<BuildSettingState> {
  BuildSettingCubit() : super(BuildSettingInitial());

  List items = [
    SettingItemModel(name: 'Address', onTap: () {}),
    SettingItemModel(name: 'Wishlist', onTap: () {}),
    SettingItemModel(name: 'Payment'),
    SettingItemModel(name: 'Dark Mode'),
    SettingItemModel(name: 'Help', onTap: () {}),
    SettingItemModel(name: 'Support', onTap: () {}),
  ];
}
