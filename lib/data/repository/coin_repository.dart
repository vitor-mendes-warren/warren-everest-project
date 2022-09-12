import '../../core/assets.dart';
import '../model/coin_model.dart';

class CoinRepository {
  List<CoinModel> getAllUserCoin() {
    List<CoinModel> coins = [];
    /*
    vitor - this code block will be used to api get request
    the mocked prices of the coins was from 09/12/2022
    */

    coins.add(CoinModel(
        name: 'Bitcoin',
        ticker: 'BTC',
        image: imgBitcoin,
        userBalance: 6557,
        coinPrice: 114471.34));
    coins.add(CoinModel(
        name: 'Ethereum',
        ticker: 'ETH',
        image: imgEthereum,
        userBalance: 1200,
        coinPrice: 8960.35));
    coins.add(CoinModel(
        name: 'Dogecoin',
        ticker: 'DOGE',
        image: imgDogeCoin,
        userBalance: 23,
        coinPrice: 0.33));
    coins.add(CoinModel(
        name: 'Bitcoin',
        ticker: 'XRP',
        image: imgXRP,
        userBalance: 300,
        coinPrice: 1.82));
    coins.add(CoinModel(
        name: 'Luna',
        ticker: 'LUNA',
        image: imgLuna,
        userBalance: 250,
        coinPrice: 27.99));
    coins.add(CoinModel(
        name: 'Litecoin',
        ticker: 'LITE',
        image: imgLiteCoin,
        userBalance: 350,
        coinPrice: 318.32));
    coins.add(CoinModel(
        name: 'Polkador',
        ticker: 'DOT',
        image: imgPolkadot,
        userBalance: 450,
        coinPrice: 39.22));

    return coins;
  }
}
