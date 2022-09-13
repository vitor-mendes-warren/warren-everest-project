import 'package:decimal/decimal.dart';

class CoinModel {
  String name;
  String ticker;
  String image;
  Decimal userBalance;
  Decimal coinPrice;
  late double percent;

  CoinModel({
    required this.name,
    required this.ticker,
    required this.image,
    required this.userBalance,
    required this.coinPrice,
  }) {
    percent = getPercentageCoin();
  }

  double getPercentageCoin() {
    return (userBalance.toDouble() * 100) / coinPrice.toDouble() / 100;
  }
}
