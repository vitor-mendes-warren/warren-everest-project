import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/portfolio/model/coin_view_data.dart';

import '../../detail/widgets/bottom_line.dart';
import '../../portfolio/provider/wallet_provider.dart';
import '../../shared/utils/util.dart';
import '../provider/conver_provider.dart';
import 'bottom_coin_list.dart';

class BodyConvert extends StatefulHookConsumerWidget {
  const BodyConvert({
    super.key,
  });

  @override
  BodyConvertState createState() => BodyConvertState();
}

class BodyConvertState extends ConsumerState<BodyConvert>
    with SingleTickerProviderStateMixin {
  TextEditingController convertValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CoinViewData coin =
        ModalRoute.of(context)!.settings.arguments as CoinViewData;
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    final walletController = ref.watch(walletControllerProvider);

    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
          ),
          color: const Color.fromARGB(255, 236, 238, 245),
          height: size.height * .08,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saldo disponível',
                style: TextStyle(
                    fontFamily: "Mansny regular",
                    fontSize: size.height * .02,
                    color: const Color.fromARGB(255, 95, 95, 95)),
              ),
              AutoSizeText(
                Util.getFormatedPercentage(
                    walletController.selectedWalletCoin.percent, coin.symbol),
                maxFontSize: 25,
                maxLines: 1,
                minFontSize: 1,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.035),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                'Quanto você gostaria de converter?',
                style: TextStyle(
                  fontFamily: "Mansny regular",
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * .037,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .007,
                          vertical: size.height * .005),
                      width: size.width * 0.28,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 238, 245),
                        border: Border.all(
                          color: const Color.fromARGB(255, 227, 228, 235),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: size.height * 0.043,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: size.width * .02),
                            width: size.width * .08,
                            height: size.height * .04,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(coin.image!.small))),
                          ),
                          AutoSizeText(
                            coin.symbol,
                            maxLines: 1,
                            style: const TextStyle(
                              fontFamily: "Mansny-regular",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.cached,
                      color: Color.fromARGB(255, 244, 43, 87),
                    ),
                    InkWell(
                      onTap: () {
                        wshowModalBottomSheet<void>(
                          useSafeArea: true,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (BuildContext context) {
                            return const BottomCoinList();
                          },
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      splashColor: const Color.fromARGB(255, 244, 43, 87),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * .007,
                            vertical: size.height * .005),
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 227, 228, 235),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: size.height * 0.043,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(right: size.width * .009),
                                  width: size.width * .08,
                                  height: size.height * .04,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(allCoinsController
                                              .coinToConvert.image!.small))),
                                ),
                                AutoSizeText(
                                  allCoinsController.coinToConvert.symbol,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontFamily: "Mansny-regular",
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 22,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                  initialValue: 'fodase?',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  onChanged: (value) {
                    // if (!value.contains(coin.symbol)) {
                    //   convertValue.text = coin.symbol + value;
                    // }
                  },
                  // controller: convertValue,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 150, 150, 150)),
                      hintText: '${coin.symbol} 0,00',
                      // errorText: 'ASDASD',
                      counterText: 'COUTER TEXT',
                      helperText: 'US\$ 10.0',
                      helperStyle: TextStyle(fontSize: 15))),
            ],
          ),
        ),
        const BottomLine(),
      ],
    );
  }
}
