import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../model/coin_view_data.dart';
import '../model/wallet_view_data.dart';
import '../repository/wallet_repository.dart';

class WalletController extends ChangeNotifier {
  late WalletRepository coinRepo;
  late List<WalletViewData> coins = [];

  Decimal getTotalBalance() {
    Decimal total = Decimal.fromInt(0);
    for (WalletViewData coin in coins) {
      total += coin.userBalance;
    }
    return total;
  }
}

class AllCoinsController extends ChangeNotifier {
  late List<CoinViewData> coins = [];
}
