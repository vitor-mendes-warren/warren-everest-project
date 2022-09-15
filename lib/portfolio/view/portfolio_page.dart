import 'package:flutter/material.dart';
import 'package:warren_task_one/portfolio/widgets/portfolio_body.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio-page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavBar(),
      body: BodyPortfolio(),
    );
  }
}
