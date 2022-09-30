import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/provider/convert_provider.dart';
import '../../convert/view/convert_page.dart';
import '../../portfolio/model/coin_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';

class ConvertButton extends HookConsumerWidget {
  final CoinViewData coin;
  final List<CoinValueResponse> data;

  const ConvertButton({
    Key? key,
    required this.coin,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final convertController = ref.watch(convertControllerProvider);
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        minWidth: size.width,
        color: const Color.fromARGB(255, 224, 43, 87),
        height: size.height * 0.08,
        onPressed: () {
          // convertController.setConvertValue('0');
          // convertController.setCoinToConvert(coin);
          convertController.initValues(coin);
          Navigator.pushNamed(context, ConvertPage.route, arguments: coin);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Converter moeda',
          style: TextStyle(
            fontFamily: "Mansny regular",
            color: Colors.white,
            fontSize: size.height * 0.023,
          ),
        ),
      ),
    );
  }
}
