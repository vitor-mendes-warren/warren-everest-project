import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:warren_task_one/movements/view/movements_page.dart';
import 'package:warren_task_one/portfolio/view/portfolio_page.dart';

import '../../utils/assets.dart';
import 'bottom_nav_button.dart';

//TODO #1 criar um scaffold pattern e commitar
//TODO #2 criar as rotas nomeadar de maneira correta

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

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
              icons: warrenIcons,
              route: PortfolioPage.route,
              buttonName: 'Portfólio'),
          BottomNavButton(
              icons: cryptoIcons,
              route: MovementsPage.route,
              buttonName: 'Movimentações'),
        ],
      ),
    );
  }
}
