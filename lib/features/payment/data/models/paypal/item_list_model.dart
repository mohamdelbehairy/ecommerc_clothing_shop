class ItemListModel {
  List<Items> items;

  ItemListModel({required this.items});

  Map<String, dynamic> toJson() {
    return {
      "items": items.map((e) => e.toJson()).toList(),
    };
  }
}

class Items {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  Items(
      {required this.name,
      required this.quantity,
      required this.price,
      this.currency = "USD"});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "quantity": quantity,
      "price": price,
      "currency": currency
    };
  }
}
