import 'package:json_annotation/json_annotation.dart';

part 'coin_price_response.g.dart';

@JsonSerializable()
class CoinValueResponse {
  List<dynamic> values;
  CoinValueResponse({
    required this.values,
  });

  factory CoinValueResponse.fromJson(List<dynamic> json) =>
      _$CoinValueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinValueResponseToJson(this);
}
