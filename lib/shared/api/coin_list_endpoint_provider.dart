import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/shared/api/coin_list_endpoint.dart';

final coinlistEndpointProvider = Provider(((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.coingecko.com/api/v3'));
  return CoinlistEndpoint(dio);
}));
