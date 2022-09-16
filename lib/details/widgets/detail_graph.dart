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
            color: Colors.amber,
            height: size.height * 0.20,
            child: const Center(child: Text("GRÁFICO")),
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
