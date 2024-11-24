import '../../features/home/data/models/product_model.dart';
import '../../features/order/data/models/order_model.dart';

class CartProductModel {
  final ProductModel? productData;
  final OrderModel? orderModel;
  final bool isOrder, isProduct, isShipped, isNotify;

  CartProductModel(
      {this.productData,
      this.orderModel,
      this.isOrder = false,
      this.isProduct = false,
      this.isShipped = false,
      this.isNotify = false});
}
