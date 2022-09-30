import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../movements/view/movements_page.dart';
import '../../../portfolio/view/portfolio_page.dart';
import '../../utils/assets.dart';
import 'bottom_nav_button.dart';

class BottomNavBar extends HookConsumerWidget {
  int pageIndex;
  BottomNavBar({
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .08,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavButton(
              pageIndex: pageIndex,
              icons: warrenIcons,
              route: PortfolioPage.route,
              buttonName: 'Portfólio'),
          BottomNavButton(
              pageIndex: pageIndex,
              icons: cryptoIcons,
              route: MovementsPage.route,
              buttonName: 'Movimentações'),
        ],
      ),
    );
  }
}
