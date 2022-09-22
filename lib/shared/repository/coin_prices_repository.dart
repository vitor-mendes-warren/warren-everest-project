import 'package:warren_task_one/shared/api/coin_prices_endpoint.dart';

import '../api/models/coin_prices/get_coin_price_response.dart';

class CoinPricesRepository {
  final CoinHistoryPricesEndpoint coinHistoryPricesEndpoint;
  CoinPricesRepository({
    required this.coinHistoryPricesEndpoint,
  });

  Future<GetCoinPriceResponse> getCoinHistoryPrices(
      String coinId, String initialDate, String finalDate) async {
    final result = await coinHistoryPricesEndpoint.getCoinHistoryPrices(
        coinId, initialDate, finalDate);
    return GetCoinPriceResponse.fromJson(result.data);
  }
}
