import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/shared/api/models/coin_prices/coin_price_response.dart';

import '../../portfolio/model/wallet_view_data.dart';
import '../../shared/utils/util.dart';
import 'bottom_line.dart';
import 'convert_button.dart';
import 'currency_variation_value.dart';
import 'detail_coin_value.dart';

class DetailDescription extends HookConsumerWidget {
  final WalletViewData wallet;
  final List<CoinValueResponse> data;
  const DetailDescription({
    super.key,
    required this.wallet,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DetailCoinValue(
            description: 'Preço atual',
            value: NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
                .format(DecimalIntl(Decimal.parse(
                    (wallet.coin.market_data!.current_price.usd).toString()))),
          ),
          CurrencyVariationValue(
            description: 'Variação 24H',
            value:
                '${(wallet.coin.market_data!.price_change_percentage_24h.toStringAsFixed(2)).toString()}%',
          ),
          DetailCoinValue(
            description: 'Quantidade',
            value:
                Util.getFormatedPercentage(wallet.percent, wallet.coin.symbol),
          ),
          DetailCoinValue(
            description: 'Valor',
            value: NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
                .format(DecimalIntl(
                    Decimal.parse((wallet.userBalance.toDouble()).toString()))),
          ),
          ConvertButton(
            data: data,
            coin: wallet.coin,
          ),
          const BottomLine(),
        ],
      ),
    );
  }
}
