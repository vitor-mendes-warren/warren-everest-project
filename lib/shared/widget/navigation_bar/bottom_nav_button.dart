import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/core/app_routes.dart';
import 'package:warren_task_one/movements/view/movements_page.dart';
import 'package:warren_task_one/shared/utils/assets.dart';

import '../../../portfolio/provider/wallet_provider.dart';

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
    void setPageIndex() {
      if (icons == warrenIcons) {
        pageIndex.state = 0;
      } else {
        pageIndex.state = 1;
      }
    }

    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setPageIndex();
        Navigator.pushReplacement(context, PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return appRoutes[route]!(context);
          },
        ));
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
