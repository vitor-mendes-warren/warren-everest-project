import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/detail_provider.dart';

class CoinChart extends HookConsumerWidget {
  const CoinChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailController = ref.watch(detailControllerProvider);
    Size size = MediaQuery.of(context).size;
    return Container(
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

        swapAnimationDuration: const Duration(milliseconds: 500), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      )),
    );
  }
}