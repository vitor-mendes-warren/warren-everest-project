import 'package:flutter/foundation.dart';
import 'package:warren_task_one/data/model/coin_model.dart';
import 'package:warren_task_one/data/repository/coin_repository.dart';

class WalletController extends ChangeNotifier {
  CoinRepository coinRepo;
  late List<CoinModel> coins = [];

  WalletController(
    this.coinRepo,
  ) {
    coins = coinRepo.getAllUserCoin();
  }

  double getTotalBalance() {
    double total = 0;
    for (CoinModel coin in coins) {
      total = total + coin.userBalance;
    }
    return total;
  }
}
