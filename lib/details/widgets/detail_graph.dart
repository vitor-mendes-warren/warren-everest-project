import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'period_button.dart';

class DetailsGraph extends StatelessWidget {
  const DetailsGraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Column(
        children: [
          Container(
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
                      spots: [
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
                      ],
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
              PeriodButton(period: '5D'),
              PeriodButton(
                period: '15D',
              ),
              PeriodButton(period: '30D'),
              PeriodButton(period: '40D'),
              PeriodButton(
                period: '90D',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
