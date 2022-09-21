import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/portfolio/widgets/coin_list.dart';
import 'package:warren_task_one/portfolio/widgets/wallet_header.dart';

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
            data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        //print(data.first.name.toString());
                      },
                      icon: const Icon(Icons.abc),
                    ),
                    const WalletHeader(),
                    const CoinList()
                  ],
                ),
            error: (error, stackTrace) => Text('data'),
            loading: () => const LoadingWallet()));
  }
}
