abstract class StripRepo {
  Future<String> createPaymentIntent();
  Future<void> initPaymentSheet({required String clientSecret});
  Future<void> displayPaymentSheet();
  Future<void> makePayment();
}