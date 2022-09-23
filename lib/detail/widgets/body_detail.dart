import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/wallet_view_data.dart';
import '../../portfolio/widgets/loading_wallet.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../provider/detail_provider.dart';
import 'detail_chart.dart';
import 'detail_description.dart';
import 'detail_header.dart';

class BodyDetail extends StatefulHookConsumerWidget {
  const BodyDetail({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  final WalletViewData wallet;
  @override
  BodyDetailState createState() => BodyDetailState();
}

class BodyDetailState extends ConsumerState<BodyDetail> {
  @override
  Widget build(BuildContext context) {
    final coinHistoryPriceProvider = ref.read(coinHistoryPricesProvider);
    final detailController = ref.watch(detailControllerProvider);
    return SafeArea(
        child: coinHistoryPriceProvider.when(data: (data) {
      detailController
          .setCoinHistoryPriceValues(data as List<CoinValueResponse>);
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailsHeader(wallet: widget.wallet),
          DetailChart(wallet: widget.wallet),
          DetailDescription(data: data, wallet: widget.wallet)
        ],
      );
    }, error: (error, stackTrace) {
      return SingleChildScrollView(child: Text(stackTrace.toString()));
    }, loading: () {
      Timer(const Duration(seconds: 1), () {
        setState(() {});
      });
      return const LoadingWallet();
    }));
  }
}
