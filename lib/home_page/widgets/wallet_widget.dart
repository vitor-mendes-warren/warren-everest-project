import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/provider.dart';

class WalletWidget extends HookConsumerWidget {
  const WalletWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * .02,
        bottom: size.height * .05,
        left: size.width * .06,
        right: size.width * .06,
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
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    viewWalletValue.state = !viewWalletValue.state;
                  },
                  icon: (viewWalletValue.state)
                      ? Icon(
                          Icons.visibility,
                          size: size.height * .04,
                        )
                      : const Icon(Icons.visibility_off, size: 22),
                )
              ],
            ),
          ),
          Text((viewWalletValue.state) ? 'R\$ 14.798,00' : "******",
              style: TextStyle(
                  fontFamily: "Montserrat", fontSize: size.height * .045)),
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
