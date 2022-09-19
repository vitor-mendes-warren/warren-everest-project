import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:warren_task_one/portfolio/model/coin_model.dart';

class DetailsController extends ChangeNotifier {
  CoinModel? coin;
  int period = 5;

  List<FlSpot> getChartSpots() {
    //vai pedir do use case a requisição que devolve 
    //as coordenadas de cada moeda a partir de coin model
    return [
      const FlSpot(0, 0),
      const FlSpot(0.5, 0.5),
      const FlSpot(1, 1),
      const FlSpot(1.5, 0.8),
      const FlSpot(2, 1.8),
      const FlSpot(2.5, 2),
      const FlSpot(3, 2.5),
      const FlSpot(3.5, 3),
      const FlSpot(4, 2.8),
      const FlSpot(4.2, 3),
      const FlSpot(4.5, 3.2),
      const FlSpot(5, 4.2),
    ];
  }

  void setPeriod(int period) {
    this.period = period;

    notifyListeners();
  }
}
