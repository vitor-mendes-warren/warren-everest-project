import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/portfolio/controller/wallet_controller.dart';
import 'package:warren_task_one/portfolio/provider/provider.dart';

class CryptoTitle extends HookConsumerWidget {
  const CryptoTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    return Padding(
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
                WalletController.getVisibilityIconData(viewWalletValue.state),
                size: size.height * 0.04,
              ))
        ],
      ),
    );
  }
}
