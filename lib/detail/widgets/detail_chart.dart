import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/detail_provider.dart';
import '../../portfolio/model/coin_model.dart';

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
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 227, 228, 235),
                  width: 1,
                ),
              ),
            ),
            height: size.height * 0.15,
            width: size.width,
            child: Center(
                child: LineChart(
              LineChartData(
                  minX: 90 - detailController.period.toDouble(),
                  maxX: 90,
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: detailController.getChartSpots(),
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                      color: const Color.fromARGB(255, 224, 43, 87),
                    )
                  ]),

              swapAnimationDuration:
                  const Duration(milliseconds: 500), // Optional
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
