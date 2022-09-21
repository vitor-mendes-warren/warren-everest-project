// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_result_market_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinResultMarketDataResponse _$CoinResultMarketDataResponseFromJson(
        Map<String, dynamic> json) =>
    CoinResultMarketDataResponse(
      CoinResultMarketDataCurrentPrice.fromJson(
          json['current_price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinResultMarketDataResponseToJson(
        CoinResultMarketDataResponse instance) =>
    <String, dynamic>{
      'current_price': instance.current_price,
    };
