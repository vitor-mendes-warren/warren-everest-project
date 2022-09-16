import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../portfolio/model/coin_model.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinModel coin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: size.width * .05),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(coin.name,
                    style: TextStyle(
                      fontFamily: "Mansny regular",
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
                  fontFamily: "Mansny regular",
                  fontWeight: FontWeight.normal,
                  fontSize: size.height * .02,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 09),
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
          ]),
    );
  }
}
