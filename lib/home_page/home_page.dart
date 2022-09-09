import 'package:flutter/material.dart';

import 'widgets/wallet_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
