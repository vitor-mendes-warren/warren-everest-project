import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/presenter/controller/wallet_controller.dart';

import '../../../../core/provider.dart';

class WalletHeader extends HookConsumerWidget {
  const WalletHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    final walletController = ref.watch(walletControllerProvider);

    return Padding(
      padding: EdgeInsets.only(
        right: size.height * .01,
        top: size.height * .02,
        bottom: size.height * .05,
        left: size.width * .06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cripto',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        color: const Color.fromARGB(255, 244, 43, 87),
                        fontSize: size.height * .045)),
                IconButton(
                    onPressed: () {
                      viewWalletValue.state = !viewWalletValue.state;
                    },
                    icon: Icon(
                      WalletController.getVisibilityIconData(
                          viewWalletValue.state),
                      size: size.height * 0.04,
                    ))
              ],
            ),
          ),
          AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: WalletController.getContainerValueColor(
                      viewWalletValue.state)),
              duration: const Duration(milliseconds: 700),
              width: size.width * 0.55,
              height: size.height * .050,
              child: Visibility(
                  visible: (viewWalletValue.state),
                  child: AutoSizeText(
                      NumberFormat.simpleCurrency(
                              locale: 'pt_BR', decimalDigits: 2)
                          .format(walletController.getTotalBalance()),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: size.height * .045,
                      )))),
          const Text(
            "Valor total de moedas",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 117, 118, 128)),
          )
        ],
      ),
    );
  }
}
