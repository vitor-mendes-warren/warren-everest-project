import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../convert/provider/conver_provider.dart';
import '../repository/wallet_repository.dart';
import 'coin_list.dart';
import 'wallet_header.dart';

import '../provider/wallet_provider.dart';
import 'loading_wallet.dart';

class BodyPortfolio extends HookConsumerWidget {
  const BodyPortfolio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getAllCoinsProvider = ref.watch(getAllCoinsFutureProvider);
    final walletController = ref.watch(walletControllerProvider);
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    return SafeArea(
        child: getAllCoinsProvider.when(
            data: (data) {
              walletController.coins =
                  WalletRepository(allCoins: data).getAllUserCoin();

              allCoinsController.coins = data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [WalletHeader(), CoinList()],
              );
            },
            error: (error, stackTrace) => const AutoSizeText(
                  maxLines: 1,
                  'Ops, algo aconteceu! Tente novamente mais tarde ',
                  style: TextStyle(
                    fontFamily: "Mansny regular",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
            loading: () => const LoadingWallet()));
  }
}
