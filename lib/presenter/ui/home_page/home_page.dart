import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/home_page/widgets/crypto_list.dart';
import 'package:warren_task_one/shared/widgets/bottom_nav_bar.dart';

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
          children: const [
            //TODO implementar um formatador monetário e o valor da carteira por referência.
            WalletHeader(),
            CryptoList()
          ],
        ),
      ),
    );
  }
}
