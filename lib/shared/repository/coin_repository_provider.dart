import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/shared/api/coinlist_endpoint_provider.dart';
import 'coin_repository.dart';

final coinRepositoryProvider = Provider((ref) {
  return CoinRepository(coinEndpoint: ref.read(coinlistEndpointProvider));
});
