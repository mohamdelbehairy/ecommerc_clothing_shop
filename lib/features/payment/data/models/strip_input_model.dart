class StripInputModel {
  final int amount;
  final String currency;
  final String? customer;

  StripInputModel({required this.amount, this.currency = 'usd', this.customer});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'customer': customer,
    };
  }
}
