import 'package:e_clot_shop/core/models/category_item_model.dart';
import 'package:e_clot_shop/core/utils/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'build_home_state.dart';

class BuildHomeCubit extends Cubit<BuildHomeState> {
  BuildHomeCubit() : super(BuildHomeInitial());

  List items = [
    CategoryItemModel(image: Assets.imagesHoodies, title: 'Hoodies'),
    CategoryItemModel(image: Assets.imagesShorts, title: 'Shorts'),
    CategoryItemModel(image: Assets.imagesShoes, title: 'Shoes'),
    CategoryItemModel(image: Assets.imagesBag, title: 'Bag'),
    CategoryItemModel(image: Assets.imagesAccessories, title: 'Accessories'),
  ];

  // int activeIndex = -1;

  // void activeIndexChange(int index) {
  //   activeIndex = index;
  //   emit(ChangeIndex());
  // }
}
