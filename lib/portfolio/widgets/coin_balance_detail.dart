import 'package:flutter/material.dart';

import '../model/coin_model.dart';
import 'coin_balance.dart';
import 'coin_percentage.dart';

class CoinBalanceDetail extends StatelessWidget {
  const CoinBalanceDetail({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CoinUserModel coin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(coin.name,
                  style: const TextStyle(
                    fontSize: 21,
                    fontFamily: "Mansny-Book",
                  )),
              CoinBalance(coin: coin),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                coin.ticker,
                style: const TextStyle(
                    fontFamily: "Mansny-Book",
                    fontSize: 16,
                    color: Color.fromARGB(255, 117, 118, 128)),
              ),
              CoinPercentage(coin: coin),
            ],
          ),
        ],
      ),
    );
  }
}
