class AmountModel {
  final String total, currency;
  final Details details;

  AmountModel(
      {required this.total, this.currency = "USD", required this.details});

  Map<String, dynamic> toJson() {
    return {
      "total": total,
      "currency": currency,
      "details": details.toJson(),
    };
  }
}

class Details {
  final String subtotal, shipping;

  final int shippingDiscount;

  Details(
      {required this.subtotal, this.shipping = "0", this.shippingDiscount = 0});

  Map<String, dynamic> toJson() {
    return {
      "subtotal": subtotal,
      "shipping": shipping,
      "shipping_discount": shippingDiscount
    };
  }
}
