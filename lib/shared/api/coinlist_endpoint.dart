import 'package:dio/dio.dart';

class CoinlistEndpoint {
  final Dio _dio;
  CoinlistEndpoint(
    this._dio,
  );
  Future<Response> getAllCoins() {
    return _dio.get("/coins");
  }
}
