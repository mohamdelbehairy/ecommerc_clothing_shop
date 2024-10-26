import 'dart:math';

String generateOrderID() {
  Random random = Random();
  return (100000 + random.nextInt(900000)).toString();
}
