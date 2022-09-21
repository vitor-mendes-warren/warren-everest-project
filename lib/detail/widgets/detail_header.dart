import 'package:flutter/material.dart';

import '../../portfolio/model/coin_model.dart';
import 'coin_price.dart';
import 'coin_ticker.dart';
import 'coin_title_detail.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinUserModel coin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 27, horizontal: size.width * .05),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoinTitleDetail(
              coinIcon: coin.image,
              coinName: coin.name,
            ),
            CoinTicker(coinTicker: coin.ticker),
            CoinPrice(
              coinPrice: coin.coinPrice,
            ),
          ]),
    );
  }
}
