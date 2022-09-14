import 'package:flutter/material.dart';
import 'package:warren_task_one/portfolio/widgets/coin_list.dart';
import 'package:warren_task_one/portfolio/widgets/wallet_header.dart';

class BodyPortfolio extends StatelessWidget {
  const BodyPortfolio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [WalletHeader(), CoinList()],
      ),
    );
  }
}
