import 'package:warren_task_one/shared/api/coin_list_endpoint.dart';

import '../api/models/coin/get_all_coins_response.dart';

class CoinRepository {
  final CoinlistEndpoint coinlistEndpoint;

  CoinRepository({required this.coinlistEndpoint});

  Future<GetAllCoinsResponse> getAllCoins() async {
    final result = await coinlistEndpoint.getAllCoins();
    return GetAllCoinsResponse.fromJson({"result": result.data});
  }
}
