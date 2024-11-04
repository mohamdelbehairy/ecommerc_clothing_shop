class StripInputModel {
  final int amount;
  final String currency, customer;
  final bool isDark;

  StripInputModel(
      {required this.amount,
      this.currency = 'usd',
      required this.customer,
      this.isDark = false});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'customer': customer,
    };
  }
}
