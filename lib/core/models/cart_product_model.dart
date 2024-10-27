import '../../features/home/data/models/product_model.dart';

class CartProductModel {
  final ProductModel? productData;
  final String? size, color, quantity, orderID;
  final bool isOrder, isProduct, isShipped;

  CartProductModel(
      {this.productData,
      this.size,
      this.color,
      this.isOrder = false,
      this.isProduct = false,
      this.isShipped = false,
      this.quantity,
      this.orderID});
}
