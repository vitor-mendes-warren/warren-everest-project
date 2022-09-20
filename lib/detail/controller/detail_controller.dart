import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../portfolio/model/coin_model.dart';
import '../../shared/utils/util.dart';

class DetailsController extends ChangeNotifier {
  CoinModel? coin;
  int period = 5;

  List<FlSpot> getChartSpots() {
    //TODO criar um use case e requisitar os spots
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

  double getLowestPrice() {
    List<double> priceRange = UtilDataMocked.priceValues.sublist(0, period);
    double lowlestPrice = 0;
    for (double price in priceRange) {
      if (price <= lowlestPrice) {
        lowlestPrice = price;
      }
    }
    return lowlestPrice;
  }

  double getHighestPrice() {
    List<double> priceRange = UtilDataMocked.priceValues.sublist(0, period);
    double highestPrice = 0;
    for (double price in priceRange) {
      if (price >= highestPrice) {
        highestPrice = price;
      }
    }
    return highestPrice;
  }

  void setPeriod(int period) {
    this.period = period;

    notifyListeners();
  }
}
