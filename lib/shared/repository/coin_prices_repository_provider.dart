import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/shared/api/coin_list_endpoint_provider.dart';
import 'package:warren_task_one/shared/repository/coin_prices_repository.dart';

final coinPricesRepositoryProvider = Provider((ref) {
  return CoinPricesRepository(coinEndpoint: ref.read(coinEndpointProvider));
});
