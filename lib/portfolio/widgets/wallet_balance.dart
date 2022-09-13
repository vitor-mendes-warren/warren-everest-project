import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/provider.dart';

class WalletBalance extends HookConsumerWidget {
  const WalletBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    final walletController = ref.watch(walletControllerProvider);
    return AnimatedContainer(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color:
                WalletController.getContainerValueColor(viewWalletValue.state)),
        duration: const Duration(milliseconds: 700),
        width: size.width * 0.55,
        height: size.height * .050,
        child: Visibility(
            visible: (viewWalletValue.state),
            child: AutoSizeText(
                NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                    .format(DecimalIntl(walletController.getTotalBalance())),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontSize: size.height * .045,
                ))));
  }
}