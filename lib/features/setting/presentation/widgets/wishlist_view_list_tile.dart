import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/core/widgets/back_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/back_widget_model.dart';
import '../../../../core/widgets/background_list_tile.dart';
import '../../data/models/wishlist_list_tile_model.dart';
import 'wishlist_list_tile_leading.dart';

class WishlistViewListTile extends StatelessWidget {
  const WishlistViewListTile({super.key, required this.wishlistModel});
  final WishlistListTileModel wishlistModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: wishlistModel.onTap,
      child: BackgroundListTile(
          padding: 24,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const WishlistListTileLeading(),
            title: Text(wishlistModel.name, style: Styles.styleBold16(context)),
            subtitle: Text(wishlistModel.productsNumber,
                style: Styles.styleMediumWithOpacity12(context)),
            trailing: BackWidget(backWidgetModel: BackWidgetModel(hight: 18)),
          )),
    );
  }
}
