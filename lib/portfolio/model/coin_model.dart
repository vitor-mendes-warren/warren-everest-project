import 'package:decimal/decimal.dart';

class CoinUserModel {
  String name;
  String ticker;
  String image;
  Decimal userBalance;
  Decimal coinPrice;
  late double percent;
  double variationDay;

  CoinUserModel({
    required this.name,
    required this.ticker,
    required this.image,
    required this.userBalance,
    required this.coinPrice,
    required this.variationDay,
  }) {
    percent = getPercentageCoin();
  }

  double getPercentageCoin() {
    return (userBalance.toDouble() * 100) / coinPrice.toDouble() / 100;
  }
}
