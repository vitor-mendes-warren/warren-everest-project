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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Carteira',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * .03)),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  viewWalletValue.state = !viewWalletValue.state;
                },
                icon: (viewWalletValue.state)
                    ? const Icon(
                        Icons.visibility,
                        size: 22,
                      )
                    : const Icon(Icons.visibility_off, size: 22),
              )
            ],
          ),
          Text((viewWalletValue.state) ? 'US\$ 1.000,00' : "******",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * .03)),
        ],
      ),
    );
  }
}
