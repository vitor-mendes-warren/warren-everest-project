import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/detail/provider/detail_provider.dart';
import 'package:warren_task_one/portfolio/model/coin_model.dart';

import 'period_button.dart';

class DetailChart extends HookConsumerWidget {
  final CoinModel coin;
  const DetailChart({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailController = ref.watch(detailControllerProvider);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
            child: Center(
                child: LineChart(
              LineChartData(
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 5,
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: detailController.getChartSpots(),
                      //   const FlSpot(0, 0),
                      //   const FlSpot(0.5, 0.5),
                      //   const FlSpot(1, 1),
                      //   const FlSpot(1.5, 0.8),
                      //   const FlSpot(2, 1.8),
                      //   const FlSpot(2.5, 2),
                      //   const FlSpot(3, 2.5),
                      //   const FlSpot(3.5, 3),
                      //   const FlSpot(4, 2.8),
                      //   const FlSpot(4.2, 3),
                      //   const FlSpot(4.5, 3.2),
                      //   const FlSpot(5, 4.2),
                      // ],
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                      color: const Color.fromARGB(255, 224, 43, 87),
                    )
                  ]),

              swapAnimationDuration:
                  const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            )),
          ),
          Row(
            children: const [
              PeriodButton(period: 5),
              PeriodButton(
                period: 15,
              ),
              PeriodButton(period: 30),
              PeriodButton(period: 40),
              PeriodButton(
                period: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
