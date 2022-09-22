import 'package:warren_task_one/detail/model/coin_price_view_data.dart';
import 'package:warren_task_one/shared/api/models/coin_prices/coin_price_response.dart';
import 'package:warren_task_one/shared/api/models/coin_prices/get_coin_price_response.dart';

extension CoinMapper on GetCoinPriceResponse {
  List<CoinValueResponse> toViewData() {
    return price;
  }
}
