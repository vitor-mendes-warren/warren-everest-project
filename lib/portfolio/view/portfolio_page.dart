import 'package:flutter/material.dart';

import '../../shared/widget/bottom_nav_bar.dart';
import '../widgets/coin_list.dart';
import '../widgets/wallet_header.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      body: BodyPortfolio(),
    );
  }
}

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
