import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:warren_task_one/core/provider.dart';
import 'package:warren_task_one/data/model/coin_model.dart';

class CryptoItem extends HookConsumerWidget {
  final CoinModel coin;
  const CryptoItem({
    super.key,
    required this.coin,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .12,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .02),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                height: size.height * .07,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(coin.image))),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(coin.ticker, style: const TextStyle(fontSize: 21)),
                    AnimatedContainer(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: (viewWalletValue.state)
                              ? Colors.white
                              : const Color.fromARGB(255, 161, 161, 161),
                        ),
                        duration: const Duration(milliseconds: 700),
                        width: size.width * .24,
                        height: size.height * .026,
                        child: Visibility(
                            visible: (viewWalletValue.state),
                            child: AutoSizeText(
                                NumberFormat.simpleCurrency(
                                        locale: 'pt_BR', decimalDigits: 2)
                                    .format(coin.userBalance),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 21,
                                )))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      coin.name,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 117, 118, 128)),
                    ),
                    AnimatedContainer(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: (viewWalletValue.state)
                              ? Colors.white
                              : const Color.fromARGB(255, 161, 161, 161),
                        ),
                        duration: const Duration(milliseconds: 700),
                        width: size.width * .20,
                        height: size.height * .023,
                        child: Visibility(
                            visible: (viewWalletValue.state),
                            child: AutoSizeText(
                                maxLines: 1,
                                "${coin.percent.toStringAsFixed(2)} ${coin.ticker}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 117, 118, 128),
                                  fontSize: 16,
                                )))),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * .009, left: size.width * .04),
            child: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 14,
            ),
          )
        ]),
      ),
    );
  }
}
