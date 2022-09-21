import 'package:warren_task_one/shared/api/coinlist_endpoint.dart';
import 'package:warren_task_one/shared/api/models/coin/get_all_coins_response.dart';

class CoinRepository {
  final CoinlistEndpoint coinEndpoint;

  CoinRepository({required this.coinEndpoint});

  Future<GetAllCoinsResponse> getAllCharacters() async {
    final result = await coinEndpoint.getAllCoins();
    return GetAllCoinsResponse.fromJson({"result": result.data});
  }
}
