import 'package:flutter/material.dart';

import '../../portfolio/model/wallet_view_data.dart';
import '../widgets/body_detail.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const route = '/details-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Detalhes',
        ),
      ),
      body: BodyDetail(
          wallet: ModalRoute.of(context)!.settings.arguments as WalletViewData),
    );
  }
}
