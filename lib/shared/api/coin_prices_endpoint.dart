import 'package:dio/dio.dart';

class CoinHistoryPricesEndpoint {
  final Dio _dio;
  CoinHistoryPricesEndpoint(
    this._dio,
  );
  Future<Response> getCoinHistoryPrices(
      String coinId, String initialDate, String finalDate) {
    return _dio.get("/coins/$coinId/market_chart/range", queryParameters: {
      "vs_currency": "usd",
      "from": initialDate,
      "to": finalDate,
    });
  }
}
