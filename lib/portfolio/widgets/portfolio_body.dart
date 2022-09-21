import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/portfolio/repository/coin_repository.dart';
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
    final getAllCoinsProvider = ref.watch(allCoinsProvider);
    return SafeArea(
        child: getAllCoinsProvider.when(
            data: (data) {
              final walletController = ref.watch(walletControllerProvider);
              walletController.coins =
                  CoinRepositoryOld(allCoins: data).getAllUserCoin();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [WalletHeader(), CoinList()],
              );
            },
            error: (error, stackTrace) => const Text('erro'),
            loading: () => const LoadingWallet()));
  }
}
