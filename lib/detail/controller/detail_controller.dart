import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../portfolio/model/coin_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/utils/util.dart';

class DetailsController extends ChangeNotifier {
  late CoinViewData? coin;

  late String? initialDate = (DateTime.now()
              .subtract(const Duration(days: 90))
              .millisecondsSinceEpoch /
          1000)
      .round()
      .toString();

  late String? finalDate =
      (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();

  int period = 5;

  int _getPeriodIntervalPoint() {
    return period * 24;
  }

  double getIntervalMaxPoint() {
    return _pricesList.length.toDouble();
  }

  double getMinX() {
    return (getIntervalMaxPoint() - _getPeriodIntervalPoint().toDouble());
  }

  late List<CoinValueResponse> _pricesList;

  void setCoinHistoryPriceValues(List<CoinValueResponse> prices) {
    _pricesList = prices;
    for (var i = 0; i < _pricesList.length; i++) {
      print(
          'esse é o ponto $i data:${DateTime.fromMillisecondsSinceEpoch(_pricesList[i].values[0])} com o valor de : R\$${_pricesList[i].values[1]}');
    }
    // print(coin!.id);
    // print('quantidade de pontos ${_pricesList.length}');
  }

  List<FlSpot> getCoinHistoryChartSpots() {
    List<FlSpot> chartSpots = [];
    int j = getIntervalMaxPoint().toInt() - _getPeriodIntervalPoint() - 1;

    List<CoinValueResponse> rangeValues = _pricesList.sublist(
        (getIntervalMaxPoint().toInt()) - _getPeriodIntervalPoint(),
        getIntervalMaxPoint().toInt());

    for (var i = 0; i < rangeValues.length; i++) {
      chartSpots.add(FlSpot(j.toDouble(), rangeValues[i].values[1]));
      print(
          ' $j  = ${rangeValues[i].values[1]} data : ${DateTime.fromMillisecondsSinceEpoch(_pricesList[i].values[0])}');
      j++;
    }
    return chartSpots;
  }

  List<FlSpot> getChartSpots() {
    int j = 90;
    List<FlSpot> chartSpots = [];
    for (var i = UtilDataMocked.priceValues.length - 1;
        i != UtilDataMocked.priceValues.length - (period + 2);
        i--) {
      chartSpots.add(FlSpot(j.toDouble(), UtilDataMocked.priceValues[i]));
      j--;
    }
    return chartSpots;
  }

  void setPeriod(int period) {
    this.period = period;

    notifyListeners();
  }
}
