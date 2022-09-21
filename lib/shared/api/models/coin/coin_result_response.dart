import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

import 'package:warren_task_one/shared/api/models/coin/coin_result_image_response.dart';

import 'coin_result_market_data_response.dart';

part 'coin_result_response.g.dart';

@JsonSerializable()
class CoinResultResponse {
  final String id;
  final String symbol;
  final String name;
  final CoinResultImageResponse image;
  final CoinResultMarketDataResponse market_data;
  CoinResultResponse(
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.market_data,
  );

  factory CoinResultResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinResultResponseToJson(this);
}
