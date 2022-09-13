import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared/provider/provider.dart';
import 'crypto_item.dart';

class CryptoList extends HookConsumerWidget {
  const CryptoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletController = ref.watch(walletControllerProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: walletController.coins.length,
        itemBuilder: (context, index) {
          return CryptoItem(
            coin: walletController.coins[index],
          );
        },
      ),
    );
  }
}
