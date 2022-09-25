import 'package:flutter/material.dart';
import 'package:warren_task_one/convert/view/convert_page.dart';
import 'package:warren_task_one/core/app_routes.dart';

import 'package:warren_task_one/portfolio/model/coin_view_data.dart';

import '../../shared/api/models/coin_prices/coin_price_response.dart';

class ConvertButton extends StatelessWidget {
  final CoinViewData coin;
  final List<CoinValueResponse> data;

  const ConvertButton({
    Key? key,
    required this.coin,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        minWidth: size.width,
        color: const Color.fromARGB(255, 224, 43, 87),
        height: size.height * 0.08,
        onPressed: () {
          Navigator.pushReplacement(context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return appRoutes[ConvertPage.route]!(context);
            },
          ));
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
