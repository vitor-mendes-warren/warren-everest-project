import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/provider.dart';
import 'coin_item.dart';

class CoinList extends HookConsumerWidget {
  const CoinList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletController = ref.watch(walletControllerProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: walletController.coins.length,
        itemBuilder: (context, index) {
          return CoinItem(
            coin: walletController.coins[index],
          );
        },
      ),
    );
  }
}
