import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/detail/widgets/detail_chart.dart';
import 'package:warren_task_one/portfolio/model/coin_model.dart';
import 'package:warren_task_one/shared/utils/util.dart';
import '../widgets/detail_header.dart';
import '../widgets/detail_coin_value.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const route = '/details-page';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CoinModel coin = ModalRoute.of(context)!.settings.arguments as CoinModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Detalhes',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailsHeader(coin: coin),
          DetailChart(coin: coin),
          DetailCoinValue(
            description: 'Preço atual',
            value: NumberFormat.simpleCurrency(
                    locale: 'pt_BR', decimalDigits: 2)
                .format(DecimalIntl(Decimal.parse(coin.coinPrice.toString()))),
          ),
          const DetailCoinValue(
            description: 'Variação 24H',
            value: " -0.50 %",
          ),
          DetailCoinValue(
            description: 'Quantidade',
            value: Util.getFormatedPercentage(coin.percent, coin.ticker),
          ),
          DetailCoinValue(
            description: 'Valor',
            value: NumberFormat.simpleCurrency(
                    locale: 'pt_BR', decimalDigits: 2)
                .format(
                    DecimalIntl(Decimal.parse(coin.userBalance.toString()))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.01),
            child: MaterialButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              minWidth: size.width,
              color: const Color.fromARGB(255, 224, 43, 87),
              height: size.height * 0.08,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Converter moeda',
                style: TextStyle(
                  fontFamily: "Mansny regular",
                  color: Colors.white,
                  fontSize: size.height * 0.023,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
              height: size.height * 0.009,
              width: 130.0,
            ),
          ),
        ],
      ),
    );
  }
}
