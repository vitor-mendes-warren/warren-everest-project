import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../movements/view/movements_page.dart';
import '../../../portfolio/provider/provider.dart';
import '../../../portfolio/view/portfolio_page.dart';

class BottomNavButton extends HookConsumerWidget {
  const BottomNavButton({
    Key? key,
    required this.icons,
    required this.route,
    required this.buttonName,
  }) : super(key: key);

  final Set<String> icons;
  final String route;
  final String buttonName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider.state);
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        switch (pageIndex.state) {
          case 0:
            {
              if (route != PortfolioPage.route) {
                pageIndex.state = 1;
                Navigator.pushNamed(context, route);
              }
              break;
            }
          case 1:
            {
              if (route != MovementsPage.route) {
                pageIndex.state = 0;
                Navigator.pushNamed(context, route);
              }

              break;
            }
        }
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
              buttonName,
              style: TextStyle(fontSize: size.width * 0.03),
            )
          ],
        ),
      ),
    );
  }
}
