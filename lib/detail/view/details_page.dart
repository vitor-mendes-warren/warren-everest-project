import 'package:flutter/material.dart';
import '../widgets/detail_description.dart';
import '../widgets/detail_chart.dart';
import '../../portfolio/model/coin_model.dart';
import '../widgets/detail_header.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const route = '/details-page';

  @override
  Widget build(BuildContext context) {
    CoinModel coin = ModalRoute.of(context)!.settings.arguments as CoinModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Detalhes',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailsHeader(coin: coin),
          DetailChart(coin: coin),
          DetailDescription(coin: coin)
        ],
      ),
    );
  }
}
