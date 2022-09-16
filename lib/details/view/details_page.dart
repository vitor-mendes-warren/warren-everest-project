import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/shared/utils/assets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const route = '/details-page';
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bitcoin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * .050,
                    )),
                Container(
                  width: size.height * .07,
                  height: size.height * .07,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(imgBitcoin))),
                ),
              ],
            ),
            Text('BTC',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.height * .025,
                )),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.02, bottom: size.height * 0.05),
              child: AutoSizeText(
                  maxLines: 1,
                  NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                      .format(DecimalIntl(Decimal.parse('133500'))),
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: size.height * .045,
                  )),
            ),
            Container(
              color: Colors.amber,
              height: size.height * 0.15,
              child: const Center(child: Text("GRÁFICO")),
            )
          ],
        ),
      ),
    );
  }
}
