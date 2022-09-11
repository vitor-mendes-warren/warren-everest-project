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
                      : Icon(
                          Icons.visibility_off,
                          size: size.height * .04,
                        ),
                )
              ],
            ),
          ),

          AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: (viewWalletValue.state)
                    ? Colors.white
                    : const Color.fromARGB(255, 93, 93, 103),
              ),
              duration: const Duration(milliseconds: 400),
              width: size.width * 0.6,
              height: size.height * .055,
              child: (viewWalletValue.state)
                  ? Text('R\$ 14.798,00',
                      style: TextStyle(
                          color: Colors.black,
                          // color: (viewWalletValue.state)
                          //     ? Colors.black
                          //     : Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: size.height * .045))
                  : null),

          // Visibility(
          //   visible: (viewWalletValue.state),
          //   replacement: Container(
          //     height: size.height * .045,
          //     color: Colors.blue,
          //   ),
          //   child: Text('R\$ 14.798,00',
          //       style: TextStyle(
          //           fontFamily: "Montserrat", fontSize: size.height * .045)),
          // ),
          // Text((viewWalletValue.state) ? 'R\$ 14.798,00' : "******",
          //     style: TextStyle(
          //         fontFamily: "Montserrat", fontSize: size.height * .045)),
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
