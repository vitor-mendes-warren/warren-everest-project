import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../portfolio/model/coin_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';

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
  }

  List<CoinValueResponse> getrangeValues() {
    if (_pricesList.length <= 90) {
      return _pricesList.sublist(getIntervalMaxPoint().toInt() - period);
    } else {
      return _pricesList.sublist(
          (getIntervalMaxPoint().toInt()) - _getPeriodIntervalPoint(),
          getIntervalMaxPoint().toInt());
    }
  }

  int getY() {
    if (_pricesList.length <= 90) {
      return getIntervalMaxPoint().toInt() - period;
    } else {
      return getIntervalMaxPoint().toInt() - _getPeriodIntervalPoint();
    }
  }

  List<FlSpot> getCoinHistoryChartSpots() {
    List<FlSpot> chartSpots = [];
    List<CoinValueResponse> rangeValues = getrangeValues();
    int j = _pricesList.length;

    for (var i = rangeValues.length - 1;
        i != rangeValues.length - (_getPeriodIntervalPoint() + 1);
        i--) {
      chartSpots.add(FlSpot(j.toDouble(), rangeValues[i].values[1]));
      j--;
    }

    return chartSpots;
  }

  void setPeriod(int period) {
    this.period = period;

    notifyListeners();
  }
}
