import 'package:decimal/decimal.dart';

import 'package:warren_task_one/portfolio/model/coin_view_data.dart';

import '../../shared/utils/assets.dart';
import '../model/coin_model.dart';

class CoinRepositoryOld {
  List<CoinViewData> allCoins = [];
  CoinRepositoryOld({
    required this.allCoins,
  });
  List<CoinUserModel> getAllUserCoin() {
    List<CoinUserModel> walletCoins = [];

    walletCoins.add(CoinUserModel(
        name: allCoins[0].name,
        ticker: allCoins[0].symbol,
        //TODO formatar a imagem do model
        image: imgBitcoin,
        userBalance: Decimal.parse('5602.25'),
        coinPrice:
            Decimal.parse(allCoins[0].market_data.current_price.usd.toString()),
        variationDay: 0.30));
    walletCoins.add(CoinUserModel(
        name: 'Ethereum',
        ticker: 'ETH',
        image: imgEthereum,
        userBalance: Decimal.parse('1200.20'),
        coinPrice: Decimal.parse('8960.35'),
        variationDay: 0.12));
    walletCoins.add(CoinUserModel(
        name: 'Dogecoin',
        ticker: 'DOGE',
        image: imgDogeCoin,
        userBalance: Decimal.parse('23'),
        coinPrice: Decimal.parse('0.33'),
        variationDay: 0.03));
    walletCoins.add(CoinUserModel(
        name: 'XRP',
        ticker: 'XRP',
        image: imgXRP,
        userBalance: Decimal.parse('+0.4'),
        coinPrice: Decimal.parse('1.82'),
        variationDay: 0.50));
    walletCoins.add(CoinUserModel(
        name: 'Luna',
        ticker: 'LUNA',
        image: imgLuna,
        userBalance: Decimal.parse('250'),
        coinPrice: Decimal.parse('27.99'),
        variationDay: 300));
    walletCoins.add(CoinUserModel(
        name: 'Litecoin',
        ticker: 'LITE',
        image: imgLiteCoin,
        userBalance: Decimal.parse('1500'),
        coinPrice: Decimal.parse('318.32'),
        variationDay: 0.30));
    walletCoins.add(CoinUserModel(
        name: 'Polkador',
        ticker: 'DOT',
        image: imgPolkadot,
        userBalance: Decimal.parse('450'),
        coinPrice: Decimal.parse('39.22'),
        variationDay: 3.0));

    return walletCoins;
  }
}
