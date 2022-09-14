import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/movements/view/movements_page.dart';
import 'package:warren_task_one/portfolio/view/portfolio_page.dart';

import '../../portfolio/provider/provider.dart';
import '../utils/assets.dart';

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
          NavBarButton(icons: warrenIcons, page: const PortfolioPage()),
          NavBarButton(icons: cryptoIcons, page: const MovementsPage()),
        ],
      ),
    );
  }
}

class NavBarButton extends HookConsumerWidget {
  const NavBarButton({
    Key? key,
    required this.icons,
    required this.page,
  }) : super(key: key);

  final Set<String> icons;
  final Widget page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider.state);
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // if (pageIndex.state == 0) {

        // }
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        // if (page.runtimeType == PortfolioPage) {
        //   pageIndex.state = 0;
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) =>  page));
        // } else {
        //   pageIndex.state = 1;
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => const MovementsPage()));
        // }
      },
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              height: size.height * 0.03,
              image: AssetImage(icons.elementAt(pageIndex.state)),
              fit: BoxFit.cover,
            ),
            Text(
              'Movimentações',
              style: TextStyle(fontSize: size.width * 0.03),
            )
          ],
        ),
      ),
    );
  }
}
