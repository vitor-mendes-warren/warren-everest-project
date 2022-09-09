import 'package:flutter/material.dart';

import 'widgets/wallet_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO implementar um formatador monetário e o valor da carteira por referência.
            const WalletWidget(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height * .13,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                          color: Color.fromARGB(255, 227, 228, 235),
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(children: const [
                      CircleAvatar(
                        radius: 30,
                      )
                    ]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
