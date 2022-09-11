import 'package:flutter/material.dart';
import 'package:warren_task_one/home_page/widgets/bottom_nav_bar.dart';

import 'widgets/wallet_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO implementar um formatador monetário e o valor da carteira por referência.
            const WalletWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
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
                          horizontal: size.width * .03,
                          vertical: size.height * .02),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Container(
                                  height: size.height * .07,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/image/BTC.png'))),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("BTC",
                                          style: TextStyle(fontSize: 21)),
                                      Text("R\$ 6.557,00",
                                          style: TextStyle(fontSize: 21)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Bitcoin",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 117, 118, 128)),
                                      ),
                                      Text("0,65 BC",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 117, 118, 128)))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * .009,
                                  left: size.width * .04),
                              child: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 14,
                              ),
                            )
                          ]),
                    ),
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
