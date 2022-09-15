import 'package:flutter/material.dart';
import 'package:warren_task_one/portfolio/widgets/portfolio_body.dart';

import '../../shared/widget/navigation_bar/bottom_nav_bar.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio-page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: Colors.white,
      body: BodyPortfolio(),
    );
  }
}
