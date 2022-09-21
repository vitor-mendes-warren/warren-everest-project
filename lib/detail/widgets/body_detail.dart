import 'package:flutter/material.dart';

import '../../portfolio/model/coin_model.dart';
import 'detail_chart.dart';
import 'detail_description.dart';
import 'detail_header.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinUserModel coin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailsHeader(coin: coin),
        DetailChart(coin: coin),
        DetailDescription(coin: coin)
      ],
    );
  }
}
