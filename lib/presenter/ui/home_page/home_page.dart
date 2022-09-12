import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_nav_bar.dart';
import 'widgets/crypto_list.dart';
import 'widgets/wallet_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [WalletHeader(), CryptoList()],
        ),
      ),
    );
  }
}
