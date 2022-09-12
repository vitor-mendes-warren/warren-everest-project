class CoinModel {
  String name;
  String ticker;
  String image;
  double userBalance;
  double coinPrice;
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
    return ((userBalance * 100) / coinPrice) / 100;
  }
}
