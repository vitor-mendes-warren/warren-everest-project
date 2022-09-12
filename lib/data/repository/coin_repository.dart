import 'package:warren_task_one/data/model/coin_model.dart';

class CoinRepository {
  List<CoinModel> coins = [];

  List<CoinModel> getAllUserCoin()  {
        //TODO terminei por aqui, colocar as imagens em um arquivo no core, e adicionar mais moedas
    coins.add(CoinModel(name: 'Bitcoin', ticker: 'BTC', image: image, price: price, percent: percent))


  }

}
