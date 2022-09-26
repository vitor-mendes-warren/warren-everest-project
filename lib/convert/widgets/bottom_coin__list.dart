import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/coin_view_data.dart';
import '../provider/conver_provider.dart';

class BottomCoinList extends HookConsumerWidget {
  const BottomCoinList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    List<CoinViewData> _allCoinsList = allCoinsController.coins;

    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 75, 75, 75),
              blurRadius: 15,
            )
          ],
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17), topRight: Radius.circular(17))),
      height: size.height * 0.32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.018),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 185, 186, 199),
              ),
              height: size.height * 0.009,
              width: size.width * .13,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 25, horizontal: size.height * .02),
            child: Text(
              'Escolha uma moeda para converter',
              style: TextStyle(
                  fontFamily: "Mansny regular",
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.normal,
                  fontSize: size.height * .021,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _allCoinsList.length,
            itemBuilder: (context, index) {
              return Card(
                  borderOnForeground: true,
                  elevation: 4,
                  child: InkWell(
                    splashColor: const Color.fromARGB(255, 244, 43, 87),
                    borderRadius: BorderRadius.circular(3),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(size.height * .02),
                      height: size.height * 0.1,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromARGB(255, 227, 228, 235),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: size.width * .05),
                            width: size.width * .12,
                            height: size.height * .07,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        _allCoinsList[index].image!.small))),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _allCoinsList[index].name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 14,
                                    )
                                  ],
                                ),
                                Text(
                                  _allCoinsList[index].symbol,
                                  style: TextStyle(
                                      fontFamily: "Mansny-regular",
                                      fontWeight: FontWeight.w300,
                                      // fontWeight: FontWeight.normal,
                                      fontSize: size.height * .018,
                                      color: const Color.fromARGB(
                                          255, 154, 154, 163)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
              // Container(
              //   padding: EdgeInsets.all(size.height * .02),
              //   height: size.height * 0.1,
              //   decoration: const BoxDecoration(

              //     border: Border(
              //       top: BorderSide(
              //         color: Color.fromARGB(255, 227, 228, 235),
              //         width: 2,
              //       ),
              //     ),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             _allCoinsList[index].name,
              //             style: const TextStyle(
              //                 fontSize: 20, fontWeight: FontWeight.bold),
              //           ),
              //           const Icon(
              //             Icons.arrow_forward_ios_sharp,
              //             size: 14,
              //           )
              //         ],
              //       ),
              //       Text(
              //         _allCoinsList[index].symbol,
              //         style: TextStyle(
              //             fontFamily: "Mansny-regular",
              //             fontWeight: FontWeight.w300,
              //             // fontWeight: FontWeight.normal,
              //             fontSize: size.height * .018,
              //             color: const Color.fromARGB(255, 154, 154, 163)),
              //       )
              //     ],
              //   ),
              // );
            },
          ))
        ],
      ),
    );
  }
}
