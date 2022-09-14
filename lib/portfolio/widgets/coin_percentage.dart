import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/portfolio/provider/provider.dart';

import '../controller/wallet_controller.dart';
import '../model/coin_model.dart';

class CoinPercentage extends HookConsumerWidget {
  final CoinModel coin;
  const CoinPercentage({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);

    return AnimatedContainer(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: WalletController.getContainerValueColor(viewWalletValue.state),
        ),
        duration: const Duration(milliseconds: 700),
        width: size.width * .20,
        height: size.height * .023,
        child: Visibility(
            visible: (viewWalletValue.state),
            child: AutoSizeText(
                maxLines: 1,
                WalletController.getFormatedPercentage(
                    coin.percent, coin.ticker),
                style: const TextStyle(
                  color: Color.fromARGB(255, 117, 118, 128),
                  fontSize: 16,
                ))));
  }
}
