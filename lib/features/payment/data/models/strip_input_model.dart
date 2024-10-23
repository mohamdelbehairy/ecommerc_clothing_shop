class StripInputModel {
  final int amount;
  final String currency, customer;

  StripInputModel(
      {required this.amount, this.currency = 'usd', required this.customer});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'customer': customer,
    };
  }
}
