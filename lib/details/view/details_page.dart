import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/portfolio/model/coin_model.dart';
import 'package:warren_task_one/shared/utils/assets.dart';

import '../../portfolio/controller/wallet_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const route = '/details-page';

  @override
  Widget build(BuildContext context) {
    CoinModel coin = ModalRoute.of(context)!.settings.arguments as CoinModel;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Detalhes',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(coin.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * .040,
                    )),
                Container(
                  width: size.height * .06,
                  height: size.height * .06,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(coin.image))),
                ),
              ],
            ),
            Text(coin.ticker,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.height * .02,
                )),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.01, bottom: size.height * 0.05),
              child: AutoSizeText(
                  maxLines: 1,
                  NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                      .format(DecimalIntl(
                          Decimal.parse(coin.coinPrice.toString()))),
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: size.height * .040,
                  )),
            ),
            Container(
              color: Colors.amber,
              height: size.height * 0.20,
              child: const Center(child: Text("GRÁFICO")),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * .017, bottom: size.height * .04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(255, 206, 206, 206),
                  ),
                  height: size.height * .035,
                  width: size.width * .10,
                  child: Center(
                      child: Text(
                    '5D',
                    style: TextStyle(
                      fontSize: size.height * .017,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  )),
                ),
              ],
            ),
            CoinPriceDetail(
              description: 'Preço atual',
              value: NumberFormat.simpleCurrency(
                      locale: 'pt_BR', decimalDigits: 2)
                  .format(
                      DecimalIntl(Decimal.parse(coin.coinPrice.toString()))),
            ),
            CoinPriceDetail(
              description: 'Variação 24H',
              value: NumberFormat.simpleCurrency(
                      locale: 'pt_BR', decimalDigits: 2)
                  .format(
                      DecimalIntl(Decimal.parse(coin.coinPrice.toString()))),
            ),
            CoinPriceDetail(
              description: 'Quantidade',
              value: WalletController.getFormatedPercentage(
                  coin.percent, coin.ticker),
            ),
            CoinPriceDetail(
              description: 'Valor',
              value: NumberFormat.simpleCurrency(
                      locale: 'pt_BR', decimalDigits: 2)
                  .format(
                      DecimalIntl(Decimal.parse(coin.userBalance.toString()))),
            ),
          ],
        ),
      ),
    );
  }
}

class CoinPriceDetail extends StatelessWidget {
  const CoinPriceDetail({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 2,
          ),
        ),
      ),
      margin: EdgeInsets.only(left: size.width * 0.05),
      height: size.height * .08,
      child: Padding(
        padding: EdgeInsets.only(right: size.width * .04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              description,
              style: TextStyle(
                color: const Color.fromARGB(255, 117, 118, 128),
                fontSize: size.height * .025,
              ),
            ),
            AutoSizeText(
                maxLines: 1,
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * .025,
                ))
          ],
        ),
      ),
    );
  }
}
