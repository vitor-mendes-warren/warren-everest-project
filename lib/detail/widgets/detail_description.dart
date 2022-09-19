import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/detail/widgets/currency_variation_value.dart';
import 'bottom_line.dart';
import 'convert_button.dart';
import 'detail_coin_value.dart';

import '../../portfolio/model/coin_model.dart';
import '../../shared/utils/util.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinModel coin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DetailCoinValue(
            description: 'Preço atual',
            value: NumberFormat.simpleCurrency(
                    locale: 'pt_BR', decimalDigits: 2)
                .format(DecimalIntl(Decimal.parse(coin.coinPrice.toString()))),
          ),
          CurrencyVariationValue(
            description: 'Variação 24H',
            value: coin.variationDay,
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
          const ConvertButton(),
          const BottomLine(),
        ],
      ),
    );
  }
}
