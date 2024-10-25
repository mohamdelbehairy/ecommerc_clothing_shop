import 'package:e_clot_shop/core/utils/api_service.dart';
import 'package:e_clot_shop/core/utils/secret_key.dart';

import 'currency_repo.dart';

class CurrencyRepoImpl extends CurrencyRepo {
  final ApiService _apiService;

  CurrencyRepoImpl(this._apiService);

  @override
  Future<String> getCurrency() async {
    final response = await _apiService.get(
        url:
            'https://api.currencyfreaks.com/v2.0/rates/latest?apikey=${SecretKey.currencyAPIKey}&symbols=EGP');

    double currencyValue = double.parse(response.data['rates']['EGP']);

    String currencyString = currencyValue.toStringAsFixed(2);

    return currencyString;
  }
}
