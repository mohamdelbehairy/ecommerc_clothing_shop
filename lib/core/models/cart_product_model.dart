import '../../features/home/data/models/product_model.dart';

class CartProductModel {
  final ProductModel? productData;
  final String? size, color, quantity;
  final bool isOrder, isProduct;

  CartProductModel(
      {this.productData,
      this.size,
      this.color,
      this.isOrder = false,
      this.isProduct = false,
      this.quantity});
}
