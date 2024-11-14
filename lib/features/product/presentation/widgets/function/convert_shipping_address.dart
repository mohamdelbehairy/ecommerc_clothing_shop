String convertShippingAddress(String address) {
  List<String> list = address.split(', ');

  String result = list.join(', ');

  if (address.contains(', ')) {
    result =
        '${result.substring(0, result.lastIndexOf(', '))} ${result.substring(result.lastIndexOf(', ') + 2)}';
  }

  return result;
}