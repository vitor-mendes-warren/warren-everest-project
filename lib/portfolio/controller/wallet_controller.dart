import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../model/coin_model.dart';
import '../repository/coin_repository.dart';

class WalletController extends ChangeNotifier {
  late CoinRepositoryOld coinRepo;
  late List<CoinUserModel> coins = [];

  Decimal getTotalBalance() {
    Decimal total = Decimal.fromInt(0);
    for (CoinUserModel coin in coins) {
      total += coin.userBalance;
    }
    return total;
  }
}
