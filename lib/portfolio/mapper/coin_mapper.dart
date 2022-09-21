import 'package:warren_task_one/portfolio/model/coin_view_data.dart';
import 'package:warren_task_one/shared/api/models/coin/get_all_coins_response.dart';

extension CoinMapper on GetAllCoinsResponse {
  List<CoinViewData> toViewData() {
    return result
        .map((result) => CoinViewData(
            id: result.id,
            symbol: result.symbol,
            name: result.name,
            image: result.image,
            market_data: result.market_data))
        .toList();
  }
}
