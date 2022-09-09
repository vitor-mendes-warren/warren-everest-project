import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewWalletValueProvider = StateProvider<bool>(
  (ref) => false,
);

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO implementar um formatador monetário e o valor da carteira por referência.

              const WalletWidget(),
              Container(
                width: size.width,
                height: 200,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WalletWidget extends HookConsumerWidget {
  const WalletWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Carteira',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * .03)),
              Text((viewWalletValue.state) ? 'US\$ 1.000,00' : "******",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * .03)),
            ],
          ),
          IconButton(
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
    );
  }
}
