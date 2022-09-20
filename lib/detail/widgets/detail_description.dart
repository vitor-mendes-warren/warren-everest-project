import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../provider/detail_provider.dart';
import 'currency_variation_value.dart';
import 'bottom_line.dart';
import 'convert_button.dart';
import 'detail_coin_value.dart';

import '../../portfolio/model/coin_model.dart';
import '../../shared/utils/util.dart';

class DetailDescription extends HookConsumerWidget {
  const DetailDescription({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinModel coin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailController = ref.watch(detailControllerProvider);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DetailCoinValue(
            description: 'Preço atual',
            value: NumberFormat.simpleCurrency(
                    locale: 'pt_BR', decimalDigits: 2)
                .format(DecimalIntl(Decimal.parse(
                    (coin.coinPrice.toDouble() + detailController.period * 100)
                        .toString()))),
          ),
          CurrencyVariationValue(
            description: 'Variação 24H',
            value:
                '${(coin.variationDay * detailController.period / 10).toString()}%',
          ),
          DetailCoinValue(
            description: 'Quantidade',
            value: Util.getFormatedPercentage(
                coin.percent * detailController.period, coin.ticker),
          ),
          DetailCoinValue(
            description: 'Valor',
            value:
                NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                    .format(DecimalIntl(Decimal.parse(
                        (coin.userBalance.toDouble() +
                                detailController.period * 100)
                            .toString()))),
          ),
          const ConvertButton(),
          const BottomLine(),
        ],
      ),
    );
  }
}
