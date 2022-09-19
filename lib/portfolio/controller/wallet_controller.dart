import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../model/coin_model.dart';
import '../repository/coin_repository.dart';

class WalletController extends ChangeNotifier {
  CoinRepository coinRepo;
  late List<CoinModel> coins = [];

  WalletController(
    this.coinRepo,
  ) {
    coins = coinRepo.getAllUserCoin();
  }

  Decimal getTotalBalance() {
    Decimal total = Decimal.fromInt(0);
    for (CoinModel coin in coins) {
      total += coin.userBalance;
    }
    return total;
  }
}
