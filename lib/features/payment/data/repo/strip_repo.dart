import '../models/strip_input_model.dart';

abstract class StripRepo {
  Future<String> createPaymentIntent(StripInputModel stripInputModel);
  Future<void> initPaymentSheet({required String clientSecret});
  Future<void> displayPaymentSheet();
  Future<void> makePayment(StripInputModel stripInputModel);
}