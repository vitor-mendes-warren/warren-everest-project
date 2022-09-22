import 'package:json_annotation/json_annotation.dart';

part 'coin_result_market_data_current_price.g.dart';

@JsonSerializable()
class CoinResultMarketDataCurrentPrice {
  final double usd;

  CoinResultMarketDataCurrentPrice(
    this.usd,
  );
  factory CoinResultMarketDataCurrentPrice.fromJson(
          Map<String, dynamic> json) =>
      _$CoinResultMarketDataCurrentPriceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CoinResultMarketDataCurrentPriceToJson(this);
}
