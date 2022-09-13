import 'package:decimal/decimal.dart';

import '../../core/assets.dart';
import '../model/coin_model.dart';

class CoinRepository {
  List<CoinModel> getAllUserCoin() {
    List<CoinModel> coins = [];

    coins.add(CoinModel(
        name: 'Bitcoin',
        ticker: 'BTC',
        image: imgBitcoin,
        userBalance: Decimal.parse('5602.25'),
        coinPrice: Decimal.parse('114471.34')));
    coins.add(CoinModel(
        name: 'Ethereum',
        ticker: 'ETH',
        image: imgEthereum,
        userBalance: Decimal.parse('1200.20'),
        coinPrice: Decimal.parse('8960.35')));
    // coins.add(CoinModel(
    //     name: 'fodase?',
    //     ticker: 'fdc',
    //     image: imgEthereum,
    //     userBalance: Decimal.parse('20'),
    //     coinPrice: Decimal.parse('8960.35')));
    coins.add(CoinModel(
        name: 'Dogecoin',
        ticker: 'DOGE',
        image: imgDogeCoin,
        userBalance: Decimal.parse('23'),
        coinPrice: Decimal.parse('0.33')));
    coins.add(CoinModel(
        name: 'Bitcoin',
        ticker: 'XRP',
        image: imgXRP,
        userBalance: Decimal.parse('300'),
        coinPrice: Decimal.parse('1.82')));
    coins.add(CoinModel(
        name: 'Luna',
        ticker: 'LUNA',
        image: imgLuna,
        userBalance: Decimal.parse('250'),
        coinPrice: Decimal.parse('27.99')));
    coins.add(CoinModel(
        name: 'Litecoin',
        ticker: 'LITE',
        image: imgLiteCoin,
        userBalance: Decimal.parse('1500'),
        coinPrice: Decimal.parse('318.32')));
    coins.add(CoinModel(
        name: 'Polkador',
        ticker: 'DOT',
        image: imgPolkadot,
        userBalance: Decimal.parse('450'),
        coinPrice: Decimal.parse('39.22')));

    return coins;
  }
}