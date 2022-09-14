import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/portfolio/controller/wallet_controller.dart';
import 'package:warren_task_one/portfolio/model/coin_model.dart';
import 'package:warren_task_one/shared/utils/provider.dart';

class CoinBalance extends HookConsumerWidget {
  const CoinBalance({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinModel coin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    return AnimatedContainer(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color:
                WalletController.getContainerValueColor(viewWalletValue.state)),
        duration: const Duration(milliseconds: 700),
        width: size.width * .24,
        height: size.height * .026,
        child: Visibility(
            visible: (viewWalletValue.state),
            child: AutoSizeText(
                NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                    .format(DecimalIntl(coin.userBalance)),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                ))));
  }
}
